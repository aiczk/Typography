#!/usr/bin/env python3
"""
Typography Release Script

Prepares the package for release:
1. Copies shader to temp file
2. Expands temp shader to 32 slots
3. Updates shader path with version
4. Creates .unitypackage (using temp shader)
5. Cleans up temp file

Original shader is never modified.

Usage:
    python release.py v2.3.0              # Prepare release
    python release.py v2.3.0 --dry-run    # Preview changes
"""

from __future__ import annotations
import argparse
import re
import shutil
import sys
import tarfile
import tempfile
from pathlib import Path
from typing import List, Tuple, Optional

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent  # Typography/
SHADER_DIR = PROJECT_ROOT / "Shader"
SHADER_PATH = SHADER_DIR / "Typography.shader"

# Slot configuration
RELEASE_IMAGE_COUNT = 32
RELEASE_TEXT_COUNT = 32

# Shader path pattern
SHADER_PATH_PATTERN = re.compile(r'^(Shader\s+")([^"]+)(")')

# Package exclusions
EXCLUDE_PATTERNS = [
    r'\.git', r'\.github', r'\.claude', r'__pycache__', r'\.pyc$',
    r'\.DS_Store', r'Thumbs\.db', r'\.vs', r'\.idea', r'\.vscode',
    r'tmpclaude-', r'\.backup', r'CLAUDE\.md', r'Other/',
    r'\.release\.shader$',  # Exclude temp shader
]


# ============================================================================
# Shader Slot Expansion
# ============================================================================

def replace_index_in_line(line: str, old_idx: int, new_idx: int) -> str:
    """Replace index in shader line (handles CurveData and standard properties)."""
    result = line
    # CurveData: _CurveData{Axis}{N}_{Part} - replace text index only, preserve part suffix
    for axis in ['TX', 'TY', 'TZ', 'X', 'Y', 'Z']:
        result = result.replace(f'_CurveData{axis}{old_idx}_', f'_CurveData{axis}{new_idx}_')
    # Standard suffix - exclude underscore prefix to avoid matching _0/_1 part suffixes
    pattern = re.compile(rf'([a-zA-Z])({old_idx})(?=\s|"|,|\(|\)|$|\[|\]|\}})')
    result = pattern.sub(rf'\g<1>{new_idx}', result)
    # Specific patterns
    result = result.replace(f'case {old_idx}:', f'case {new_idx}:')
    result = result.replace(f'"Image {old_idx}"', f'"Image {new_idx}"')
    result = result.replace(f'"Text {old_idx}"', f'"Text {new_idx}"')
    result = result.replace(f'DECLARE_TEXT_LAYER_VARS({old_idx})', f'DECLARE_TEXT_LAYER_VARS({new_idx})')
    result = result.replace(f'LOAD_TEXT_LAYER({old_idx},', f'LOAD_TEXT_LAYER({new_idx},')
    result = result.replace(f'LOAD_IMAGE_PARAMS({old_idx},', f'LOAD_IMAGE_PARAMS({new_idx},')
    return result


def reindex_block(block: List[str], old_idx: int, new_idx: int) -> List[str]:
    return [replace_index_in_line(line, old_idx, new_idx) for line in block]


def extract_block_until(lines: List[str], start: int, end_marker: str) -> Tuple[List[str], int]:
    block = []
    i = start
    while i < len(lines):
        block.append(lines[i])
        if end_marker in lines[i]:
            return block, i + 1
        i += 1
    return block, i


def process_shader_slots(content: str, image_count: int, text_count: int) -> str:
    """Process shader and modify slot counts."""
    lines = content.split('\n')
    result = []
    i = 0

    while i < len(lines):
        line = lines[i]

        # IMAGE PROPERTIES
        if '[HideInInspector][Toggle] _ImageUse0' in line:
            template, end_i = extract_block_until(lines, i, '[DynamicThryLabel] _ImageLabel')
            for n in range(image_count):
                result.extend(reindex_block(template, 0, n))
                if n < image_count - 1:
                    result.append('')
            i = end_i
            while i < len(lines):
                if '[HideInInspector][Toggle] _ImageUse' in lines[i] and '_ImageUse0' not in lines[i]:
                    _, i = extract_block_until(lines, i, '[DynamicThryLabel] _ImageLabel')
                elif '[HideInInspector] m_end_image_setting ("Image Settings"' in lines[i]:
                    break
                else:
                    i += 1
            continue

        # TEXT PROPERTIES
        if '[HideInInspector][Toggle] _Use0 ("", Float)' in line:
            template, end_i = extract_block_until(lines, i, '[DynamicThryLabel] _TextLabel')
            for n in range(text_count):
                reindexed = reindex_block(template, 0, n)
                if n == 0:
                    reindexed = [l.replace('_Use0 ("", Float) = 0', '_Use0 ("", Float) = 1') for l in reindexed]
                result.extend(reindexed)
                if n < text_count - 1:
                    result.append('')
            i = end_i
            while i < len(lines):
                if '[HideInInspector][Toggle] _Use' in lines[i] and '_Use0' not in lines[i]:
                    _, i = extract_block_until(lines, i, '[DynamicThryLabel] _TextLabel')
                elif '[HideInInspector] m_end_text_setting ("Text Settings"' in lines[i]:
                    break
                else:
                    i += 1
            continue

        # DECLARE_TEXT_LAYER_VARS
        if 'DECLARE_TEXT_LAYER_VARS(0)' in line:
            indent = line[:len(line) - len(line.lstrip())]
            for n in range(text_count):
                result.append(f'{indent}DECLARE_TEXT_LAYER_VARS({n})')
            i += 1
            while i < len(lines) and 'DECLARE_TEXT_LAYER_VARS(' in lines[i]:
                i += 1
            continue

        # LOAD_TEXT_LAYER switch
        if 'case 0: LOAD_TEXT_LAYER(0, layer); break;' in line:
            indent = line[:len(line) - len(line.lstrip())]
            for n in range(text_count):
                result.append(f'{indent}case {n}: LOAD_TEXT_LAYER({n}, layer); break;')
            i += 1
            while i < len(lines) and 'LOAD_TEXT_LAYER(' in lines[i] and 'default:' not in lines[i]:
                i += 1
            continue

        # LOAD_IMAGE_PARAMS switch
        if 'case 0: LOAD_IMAGE_PARAMS(0, p);' in line:
            indent = line[:len(line) - len(line.lstrip())]
            for n in range(image_count - 1):
                result.append(f'{indent}case {n}: LOAD_IMAGE_PARAMS({n}, p); break;')
            i += 1
            while i < len(lines) and 'LOAD_IMAGE_PARAMS(' in lines[i] and 'default:' not in lines[i]:
                i += 1
            if i < len(lines) and 'default: LOAD_IMAGE_PARAMS' in lines[i]:
                result.append(f'{indent}default: LOAD_IMAGE_PARAMS({image_count - 1}, p); break;')
                i += 1
            continue

        result.append(line)
        i += 1

    return '\n'.join(result)


def expand_shader(shader_path: Path, image_count: int, text_count: int) -> Tuple[bool, int, int]:
    """Expand shader to specified slot counts. Returns (success, orig_lines, new_lines)."""
    original = shader_path.read_text(encoding='utf-8')
    output = process_shader_slots(original, image_count, text_count)

    orig_lines = original.count('\n')
    out_lines = output.count('\n')

    shader_path.write_text(output, encoding='utf-8')
    return True, orig_lines, out_lines


def update_shader_path(shader_path: Path, new_path: str) -> Optional[str]:
    """Update shader path. Returns old path or None on failure."""
    content = shader_path.read_text(encoding='utf-8')
    lines = content.split('\n')

    for i, line in enumerate(lines):
        match = SHADER_PATH_PATTERN.match(line)
        if match:
            old_path = match.group(2)
            lines[i] = f'{match.group(1)}{new_path}{match.group(3)}'
            shader_path.write_text('\n'.join(lines), encoding='utf-8')
            return old_path

    return None


# ============================================================================
# Unity Package Creation
# ============================================================================

def should_exclude(path: str) -> bool:
    for pattern in EXCLUDE_PATTERNS:
        if re.search(pattern, path):
            return True
    return False


def extract_guid(meta_path: Path) -> Optional[str]:
    if not meta_path.exists():
        return None
    match = re.search(r'guid:\s*([a-f0-9]+)', meta_path.read_text(encoding='utf-8'))
    return match.group(1) if match else None


def create_unitypackage(version: str, shader_override: Optional[Path] = None) -> Optional[Path]:
    """Create .unitypackage file."""
    output_path = PROJECT_ROOT / f"Typography.v{version}.unitypackage"
    files = []

    # Collect files
    for path in PROJECT_ROOT.rglob('*'):
        if path.is_dir() or path.suffix == '.meta':
            continue
        rel = str(path.relative_to(PROJECT_ROOT)).replace('\\', '/')
        if should_exclude(rel):
            continue
        meta = path.with_suffix(path.suffix + '.meta')
        guid = extract_guid(meta)
        if guid:
            # Use shader_override for Typography.shader
            if shader_override and path == SHADER_PATH:
                files.append((shader_override, meta, guid))
            else:
                files.append((path, meta, guid))

    # Collect folder metas
    for path in PROJECT_ROOT.rglob('*'):
        if not path.is_dir():
            continue
        rel = str(path.relative_to(PROJECT_ROOT)).replace('\\', '/')
        if should_exclude(rel):
            continue
        meta = Path(str(path) + '.meta')
        guid = extract_guid(meta)
        if guid:
            files.append((None, meta, guid))

    print(f"  Files: {len(files)} items")

    # Create package
    with tempfile.TemporaryDirectory() as tmpdir:
        tmp = Path(tmpdir)
        for file_path, meta_path, guid in files:
            gdir = tmp / guid
            gdir.mkdir(exist_ok=True)

            if file_path:
                try:
                    rel = file_path.relative_to(PROJECT_ROOT)
                except ValueError:
                    rel = Path("Shader/Typography.shader")
                pathname = f"Assets/Typography/{rel}".replace('\\', '/')
                shutil.copy2(file_path, gdir / "asset")
            else:
                rel = meta_path.relative_to(PROJECT_ROOT)
                pathname = f"Assets/Typography/{str(rel)[:-5]}".replace('\\', '/')

            (gdir / "pathname").write_text(pathname, encoding='utf-8')
            shutil.copy2(meta_path, gdir / "asset.meta")

        with tarfile.open(output_path, "w:gz") as tar:
            for gdir in tmp.iterdir():
                if gdir.is_dir():
                    for item in gdir.iterdir():
                        tar.add(item, arcname=f"{gdir.name}/{item.name}")

    print(f"  Output: {output_path.name} ({output_path.stat().st_size / 1024:.1f} KB)")
    return output_path


# ============================================================================
# Main
# ============================================================================

def prepare_release(version: str, dry_run: bool = False) -> bool:
    """Prepare package for release. Original shader is never modified."""
    v = version[1:] if version.startswith('v') else version
    mode = " (dry-run)" if dry_run else ""

    print(f"\n{'='*50}")
    print(f"Release Typography v{v}{mode}")
    print(f"{'='*50}\n")

    if not SHADER_PATH.exists():
        print(f"Error: Shader not found at {SHADER_PATH}")
        return False

    # Create temp copy
    temp_shader = SHADER_PATH.with_suffix('.release.shader')

    print("[1/4] Copying shader...")
    if not dry_run:
        shutil.copy2(SHADER_PATH, temp_shader)
    print(f"  Temp: {temp_shader.name}")

    try:
        # Expand temp shader
        print("\n[2/4] Expanding shader...")
        if dry_run:
            original = SHADER_PATH.read_text(encoding='utf-8')
            output = process_shader_slots(original, RELEASE_IMAGE_COUNT, RELEASE_TEXT_COUNT)
            orig_lines = original.count('\n')
            out_lines = output.count('\n')
        else:
            _, orig_lines, out_lines = expand_shader(temp_shader, RELEASE_IMAGE_COUNT, RELEASE_TEXT_COUNT)

        print(f"  Slots: {RELEASE_IMAGE_COUNT} images, {RELEASE_TEXT_COUNT} texts")
        print(f"  Lines: {orig_lines:,} -> {out_lines:,} ({out_lines - orig_lines:+,})")

        # Update shader path
        print("\n[3/4] Updating shader path...")
        new_path = f"GekikaraStore/{v}/Typography"
        if dry_run:
            content = SHADER_PATH.read_text(encoding='utf-8')
            match = SHADER_PATH_PATTERN.search(content)
            old_path = match.group(2) if match else "???"
        else:
            old_path = update_shader_path(temp_shader, new_path)

        if old_path:
            print(f"  Path: {old_path} -> {new_path}")
        else:
            print("Error: Shader path not found")
            return False

        # Create package
        print("\n[4/4] Creating .unitypackage...")
        if dry_run:
            print(f"  Files: (skipped in dry-run)")
        else:
            create_unitypackage(v, shader_override=temp_shader)

    finally:
        # Cleanup temp file
        if temp_shader.exists():
            temp_shader.unlink()
            print(f"\n  Cleaned up: {temp_shader.name}")

    print(f"\n{'='*50}")
    print("Done!" if not dry_run else "Dry run complete")
    print(f"{'='*50}\n")

    return True


def main():
    parser = argparse.ArgumentParser(description='Typography Release Script')
    parser.add_argument('version', help='Version tag (e.g., v2.3.0)')
    parser.add_argument('--dry-run', action='store_true', help='Preview without writing')

    args = parser.parse_args()
    return 0 if prepare_release(args.version, args.dry_run) else 1


if __name__ == '__main__':
    sys.exit(main())
