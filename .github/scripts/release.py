#!/usr/bin/env python3
"""
Typography Release Script

Creates versioned .unitypackage with:
- Shader slot expansion (10 → 32)
- Unique GUIDs for all assets
- Versioned paths (Assets/Typography/v{version}/...)
- Release notes extraction from CHANGELOG.md

Usage:
    python release.py v2.3.0              # Create release
    python release.py v2.3.0 --dry-run    # Preview only
"""

from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
import sys
import tempfile
import uuid
from pathlib import Path
from typing import Optional

# =============================================================================
# Configuration
# =============================================================================

SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent
SHADER_PATH = PROJECT_ROOT / "Shader" / "Typography.shader"
CHANGELOG_PATH = PROJECT_ROOT / "CHANGELOG.md"

RELEASE_IMAGE_COUNT = 32
RELEASE_TEXT_COUNT = 32

EXCLUDE_PATTERNS = [
    r'\.git', r'\.github', r'\.claude', r'__pycache__', r'\.pyc$',
    r'\.DS_Store', r'Thumbs\.db', r'\.vs', r'\.idea', r'\.vscode',
    r'tmpclaude-', r'\.backup', r'CLAUDE\.md', r'Other/',
    r'\.v[\d.]+\.shader$', r'\.unitypackage$',
]

SHADER_PATH_PATTERN = re.compile(r'^(Shader\s+")([^"]+)(")')


# =============================================================================
# File I/O Helpers
# =============================================================================

def read_text(path: Path) -> str:
    """Read text file preserving line endings."""
    with open(path, 'r', encoding='utf-8', newline='') as f:
        return f.read()


def write_text(path: Path, content: str) -> None:
    """Write text file preserving line endings."""
    with open(path, 'w', encoding='utf-8', newline='') as f:
        f.write(content)


def should_exclude(path: str) -> bool:
    """Check if path matches any exclusion pattern."""
    return any(re.search(p, path) for p in EXCLUDE_PATTERNS)


# =============================================================================
# GUID Utilities
# =============================================================================

def generate_guid() -> str:
    """Generate Unity-style GUID (32 hex chars)."""
    return uuid.uuid4().hex


def extract_guid(meta_path: Path) -> Optional[str]:
    """Extract GUID from .meta file."""
    if not meta_path.exists():
        return None
    match = re.search(r'guid:\s*([a-f0-9]+)', read_text(meta_path))
    return match.group(1) if match else None


def replace_guid_in_meta(content: str, new_guid: str) -> str:
    """Replace GUID in meta file content."""
    return re.sub(r'guid:\s*[a-f0-9]+', f'guid: {new_guid}', content)


def update_guids_in_content(content: str, guid_map: dict[str, str]) -> str:
    """Replace all GUIDs in content using single-pass regex."""
    def replacer(m):
        return f'guid: {guid_map.get(m.group(1), m.group(1))}'
    return re.sub(r'guid: ([a-f0-9]{32})', replacer, content)


# =============================================================================
# Shader Processing
# =============================================================================

def replace_index_in_line(line: str, old_idx: int, new_idx: int) -> str:
    """Replace slot index in shader line."""
    result = line

    # CurveData axes
    for axis in ['TX', 'TY', 'TZ', 'X', 'Y', 'Z']:
        result = result.replace(f'_CurveData{axis}{old_idx}_', f'_CurveData{axis}{new_idx}_')

    # Standard property suffix
    result = re.sub(
        rf'([a-zA-Z])({old_idx})(?=\s|"|,|\(|\)|$|\[|\]|\}})',
        rf'\g<1>{new_idx}', result
    )

    # Specific patterns
    replacements = [
        (f'case {old_idx}:', f'case {new_idx}:'),
        (f'"Image {old_idx}"', f'"Image {new_idx}"'),
        (f'"Text {old_idx}"', f'"Text {new_idx}"'),
        (f'DECLARE_TEXT_LAYER_VARS({old_idx})', f'DECLARE_TEXT_LAYER_VARS({new_idx})'),
        (f'LOAD_TEXT_LAYER({old_idx},', f'LOAD_TEXT_LAYER({new_idx},'),
        (f'LOAD_IMAGE_PARAMS({old_idx},', f'LOAD_IMAGE_PARAMS({new_idx},'),
    ]
    for old, new in replacements:
        result = result.replace(old, new)

    return result


def extract_block_until(lines: list[str], start: int, end_marker: str) -> tuple[list[str], int]:
    """Extract lines from start until end_marker is found."""
    block = []
    i = start
    while i < len(lines):
        block.append(lines[i])
        if end_marker in lines[i]:
            return block, i + 1
        i += 1
    return block, i


def reindex_block(block: list[str], old_idx: int, new_idx: int) -> list[str]:
    """Reindex all lines in block."""
    return [replace_index_in_line(line, old_idx, new_idx) for line in block]


def process_shader_slots(content: str, image_count: int, text_count: int) -> str:
    """Expand shader to specified slot counts."""
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
                elif '[HideInInspector] m_end_image_setting' in lines[i]:
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
                elif '[HideInInspector] m_end_text_setting' in lines[i]:
                    break
                else:
                    i += 1
            continue

        # DECLARE_TEXT_LAYER_VARS
        if 'DECLARE_TEXT_LAYER_VARS(0)' in line:
            indent = line[:len(line) - len(line.lstrip())]
            result.extend(f'{indent}DECLARE_TEXT_LAYER_VARS({n})' for n in range(text_count))
            i += 1
            while i < len(lines) and 'DECLARE_TEXT_LAYER_VARS(' in lines[i]:
                i += 1
            continue

        # LOAD_TEXT_LAYER switch
        if 'case 0: LOAD_TEXT_LAYER(0, layer); break;' in line:
            indent = line[:len(line) - len(line.lstrip())]
            result.extend(f'{indent}case {n}: LOAD_TEXT_LAYER({n}, layer); break;' for n in range(text_count))
            i += 1
            while i < len(lines) and 'LOAD_TEXT_LAYER(' in lines[i] and 'default:' not in lines[i]:
                i += 1
            continue

        # LOAD_IMAGE_PARAMS switch
        if 'case 0: LOAD_IMAGE_PARAMS(0, p);' in line:
            indent = line[:len(line) - len(line.lstrip())]
            result.extend(f'{indent}case {n}: LOAD_IMAGE_PARAMS({n}, p); break;' for n in range(image_count - 1))
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


def expand_shader(shader_path: Path, image_count: int, text_count: int) -> tuple[int, int]:
    """Expand shader slots. Returns (original_lines, new_lines)."""
    original = read_text(shader_path)
    expanded = process_shader_slots(original, image_count, text_count)
    write_text(shader_path, expanded)
    return original.count('\n'), expanded.count('\n')


def update_shader_path(shader_path: Path, new_path: str) -> Optional[str]:
    """Update shader path declaration. Returns old path."""
    content = read_text(shader_path)
    lines = content.split('\n')

    for i, line in enumerate(lines):
        match = SHADER_PATH_PATTERN.match(line)
        if match:
            old_path = match.group(2)
            lines[i] = f'{match.group(1)}{new_path}{match.group(3)}'
            write_text(shader_path, '\n'.join(lines))
            return old_path
    return None


# =============================================================================
# Changelog
# =============================================================================

def extract_release_notes(version: str) -> Optional[str]:
    """Extract release notes for version from CHANGELOG.md."""
    if not CHANGELOG_PATH.exists():
        return None

    content = read_text(CHANGELOG_PATH)
    version_pat = re.compile(rf'^## \[{re.escape(version)}\]')
    section_end = re.compile(r'^## \[|^---\s*$')

    lines = []
    in_section = False

    for line in content.split('\n'):
        if version_pat.match(line):
            in_section = True
        elif in_section and section_end.match(line):
            break
        if in_section:
            lines.append(line)

    while lines and not lines[-1].strip():
        lines.pop()

    return '\n'.join(lines) if lines else None


# =============================================================================
# Unity Package
# =============================================================================

def version_asmdef(content: str, version: str) -> str:
    """Add version suffix to asmdef name and references."""
    data = json.loads(content)
    if 'name' in data:
        data['name'] = f"{data['name']}.v{version}"
    if 'references' in data:
        data['references'] = [
            f"{ref}.v{version}" if ref.startswith('Typography') else ref
            for ref in data['references']
        ]
    return json.dumps(data, indent=4, ensure_ascii=False)


def collect_package_files(shader_override: Optional[Path] = None) -> tuple[list, dict[str, str]]:
    """Collect files and build GUID map. Returns (files, guid_map)."""
    files = []
    guid_map = {}

    for path in PROJECT_ROOT.rglob('*'):
        rel = str(path.relative_to(PROJECT_ROOT)).replace('\\', '/')
        if should_exclude(rel):
            continue

        if path.is_dir():
            meta = Path(str(path) + '.meta')
        else:
            if path.suffix == '.meta':
                continue
            meta = path.with_suffix(path.suffix + '.meta')

        if not meta.exists():
            continue

        old_guid = extract_guid(meta)
        new_guid = generate_guid()
        if old_guid:
            guid_map[old_guid] = new_guid

        if path.is_dir():
            files.append((None, meta, rel, new_guid))
        elif shader_override and path == SHADER_PATH:
            files.append((shader_override, meta, rel, new_guid))
        else:
            files.append((path, meta, rel, new_guid))

    return files, guid_map


def write_package_entry(
    gdir: Path,
    file_path: Optional[Path],
    meta_path: Path,
    pathname: str,
    new_guid: str,
    guid_map: dict[str, str],
    version: str
) -> None:
    """Write single entry to package directory."""
    gdir.mkdir(exist_ok=True)

    if file_path:
        if file_path.suffix == '.asmdef':
            content = version_asmdef(read_text(file_path), version)
            write_text(gdir / "asset", content)
        elif file_path.suffix in ('.mat', '.prefab'):
            # Update GUID references in Unity YAML files
            content = update_guids_in_content(read_text(file_path), guid_map)
            write_text(gdir / "asset", content)
        else:
            shutil.copy2(file_path, gdir / "asset")

    write_text(gdir / "pathname", pathname)

    meta_content = replace_guid_in_meta(read_text(meta_path), new_guid)
    write_text(gdir / "asset.meta", meta_content)


def create_unitypackage(version: str, shader_override: Optional[Path] = None) -> Path:
    """Create .unitypackage with versioned paths and new GUIDs."""
    output_path = PROJECT_ROOT / f"Typography.v{version}.unitypackage"
    files, guid_map = collect_package_files(shader_override)

    print(f"  Files: {len(files)} items")

    with tempfile.TemporaryDirectory() as tmpdir:
        tmp = Path(tmpdir)
        archtemp_dir = tmp / "archtemp"
        archtemp_dir.mkdir()

        for file_path, meta_path, rel, new_guid in files:
            pathname = f"Assets/Typography/v{version}/{rel}"
            write_package_entry(
                archtemp_dir / new_guid,
                file_path, meta_path, pathname, new_guid, guid_map, version
            )

        # Create tar.gz
        archtemp = tmp / "archtemp.tar"
        subprocess.run(
            ["tar", "-cf", str(archtemp), "-C", str(archtemp_dir)] +
            [d.name for d in archtemp_dir.iterdir()],
            check=True, capture_output=True
        )
        subprocess.run(["gzip", "-f", str(archtemp)], check=True, capture_output=True)
        shutil.copy2(tmp / "archtemp.tar.gz", output_path)

    print(f"  Output: {output_path.name} ({output_path.stat().st_size / 1024:.1f} KB)")
    return output_path


# =============================================================================
# Main
# =============================================================================

def prepare_release(version: str, dry_run: bool = False) -> bool:
    """Prepare release package."""
    v = version.lstrip('v')
    suffix = " (dry-run)" if dry_run else ""

    print(f"\n{'='*50}")
    print(f"Release Typography v{v}{suffix}")
    print(f"{'='*50}\n")

    if not SHADER_PATH.exists():
        print(f"Error: Shader not found at {SHADER_PATH}")
        return False

    temp_shader = SHADER_PATH.with_suffix(f'.{v}.shader')

    print("[1/5] Copying shader...")
    if not dry_run:
        shutil.copy2(SHADER_PATH, temp_shader)
    print(f"  Temp: {temp_shader.name}")

    try:
        print("\n[2/5] Expanding shader...")
        if dry_run:
            orig = read_text(SHADER_PATH)
            expanded = process_shader_slots(orig, RELEASE_IMAGE_COUNT, RELEASE_TEXT_COUNT)
            orig_lines, new_lines = orig.count('\n'), expanded.count('\n')
        else:
            orig_lines, new_lines = expand_shader(temp_shader, RELEASE_IMAGE_COUNT, RELEASE_TEXT_COUNT)
        print(f"  Slots: {RELEASE_IMAGE_COUNT} images, {RELEASE_TEXT_COUNT} texts")
        print(f"  Lines: {orig_lines:,} -> {new_lines:,} ({new_lines - orig_lines:+,})")

        print("\n[3/5] Updating shader path...")
        new_path = f"GekikaraStore/{v}/Typography"
        if dry_run:
            match = SHADER_PATH_PATTERN.search(read_text(SHADER_PATH))
            old_path = match.group(2) if match else "???"
        else:
            old_path = update_shader_path(temp_shader, new_path)
        if not old_path:
            print("Error: Shader path not found")
            return False
        print(f"  Path: {old_path} -> {new_path}")

        print("\n[4/5] Creating .unitypackage...")
        if dry_run:
            print("  (skipped)")
        else:
            create_unitypackage(v, shader_override=temp_shader)

        print("\n[5/5] Extracting release notes...")
        notes = extract_release_notes(v)
        notes_path = PROJECT_ROOT / "RELEASE_NOTES.md"
        if notes:
            if not dry_run:
                write_text(notes_path, notes)
            print(f"  Extracted: {len(notes)} chars")
        else:
            print(f"  Warning: No release notes for v{v}")
            if not dry_run:
                write_text(notes_path, f"## v{v}\n\nNo release notes available.")

    finally:
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
