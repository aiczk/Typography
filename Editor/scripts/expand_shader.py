#!/usr/bin/env python3
"""
Typography Shader Slot Count Reducer

Reduces Typography.shader from 32 slots to a configurable number (default: 10).
Works by extracting patterns from the existing shader and regenerating with fewer repetitions.

Usage:
    python expand_shader.py                    # Default: 10 images, 10 texts
    python expand_shader.py --image=32 --text=32  # Full version
"""

from __future__ import annotations
import argparse
import re
from pathlib import Path
from typing import List, Tuple

SCRIPT_DIR = Path(__file__).resolve().parent
SHADER_DIR = SCRIPT_DIR.parent.parent / "Shader"
SHADER_PATH = SHADER_DIR / "Typography.shader"
BACKUP_PATH = SHADER_DIR / "Typography.shader.backup32"

DEFAULT_IMAGE_COUNT = 10
DEFAULT_TEXT_COUNT = 10


def extract_image_block(lines: List[str], start_line: int) -> Tuple[List[str], int]:
    """Extract a single Image property block starting from _ImageUseN."""
    block = []
    i = start_line
    while i < len(lines):
        block.append(lines[i])
        if '[DynamicThryLabel] _ImageLabel' in lines[i]:
            return block, i + 1
        i += 1
    return block, i


def extract_text_block(lines: List[str], start_line: int) -> Tuple[List[str], int]:
    """Extract a single Text property block (including ifex wrapper) starting from _UseN."""
    block = []
    i = start_line
    in_block = False
    found_label = False

    while i < len(lines):
        block.append(lines[i])
        if '[DynamicThryLabel] _TextLabel' in lines[i]:
            found_label = True
        if found_label and '//endex' in lines[i]:
            return block, i + 1
        i += 1
    return block, i


def replace_index_in_line(line: str, old_idx: int, new_idx: int) -> str:
    """Replace all occurrences of index in a shader line.

    Only replaces indices that appear as property suffixes (e.g., _PropertyName0)
    and specific shader patterns. Does NOT replace standalone numbers.
    """
    result = line

    # Only replace indices at the end of property names (after letters)
    # Pattern: letter followed by index, then non-alphanumeric or end
    # This matches: _ImageUse0, m_start_setting0, _Position0, _ImageUse0}, etc.
    # But NOT: Range(0, 31), (0, 0, 50), etc.
    pattern = re.compile(rf'([a-zA-Z_])({old_idx})(?=\s|"|,|\(|\)|$|\[|\]|\}})')
    result = pattern.sub(rf'\g<1>{new_idx}', result)

    # Specific shader patterns that need exact replacement
    result = result.replace(f'case {old_idx}:', f'case {new_idx}:')
    result = result.replace(f'"Image {old_idx}"', f'"Image {new_idx}"')
    result = result.replace(f'"TextLabel{old_idx}"', f'"TextLabel{new_idx}"')
    result = result.replace(f'DECLARE_TEXT_VARS({old_idx})', f'DECLARE_TEXT_VARS({new_idx})')
    result = result.replace(f'LOAD_TEXT_PARAMS({old_idx},', f'LOAD_TEXT_PARAMS({new_idx},')
    result = result.replace(f'LOAD_IMAGE_PARAMS({old_idx},', f'LOAD_IMAGE_PARAMS({new_idx},')

    return result


def reindex_block(block: List[str], old_idx: int, new_idx: int) -> List[str]:
    """Reindex all occurrences in a block."""
    return [replace_index_in_line(line, old_idx, new_idx) for line in block]


def process_shader(content: str, image_count: int, text_count: int) -> str:
    """Process shader and reduce slot counts."""
    lines = content.split('\n')
    result = []
    i = 0

    # Extract index 0 blocks as templates
    image_block_0 = None
    text_block_0 = None

    while i < len(lines):
        line = lines[i]

        # ============================================================
        # IMAGE PROPERTIES SECTION
        # ============================================================
        if '[HideInInspector][Toggle] _ImageUse0' in line:
            # Extract Image 0 as template
            image_block_0, end_i = extract_image_block(lines, i)

            # Generate image_count blocks
            for n in range(image_count):
                reindexed = reindex_block(image_block_0, 0, n)
                result.extend(reindexed)
                if n < image_count - 1:
                    result.append('')  # Empty line between blocks

            # Skip remaining image blocks (1-31)
            i = end_i
            while i < len(lines):
                if '[HideInInspector][Toggle] _ImageUse' in lines[i]:
                    _, i = extract_image_block(lines, i)
                elif '[HideInInspector] m_end_image_setting ("Image Settings"' in lines[i]:
                    break
                else:
                    i += 1
            continue

        # ============================================================
        # TEXT PROPERTIES SECTION
        # ============================================================
        if '[HideInInspector][Toggle] _Use0 ("", Float)' in line:
            # Extract Text 0 as template
            text_block_0, end_i = extract_text_block(lines, i)

            # Generate text_count blocks
            for n in range(text_count):
                reindexed = reindex_block(text_block_0, 0, n)
                # Fix: First text slot should have default value 1
                if n == 0:
                    reindexed = [l.replace('_Use0 ("", Float) = 0', '_Use0 ("", Float) = 1') for l in reindexed]
                result.extend(reindexed)
                result.append('')  # Empty line between blocks

            # Skip remaining text blocks (1-31)
            i = end_i
            while i < len(lines):
                if '[HideInInspector][Toggle] _Use' in lines[i] and '_Use0' not in lines[i]:
                    _, i = extract_text_block(lines, i)
                elif '[HideInInspector] m_end_text_setting ("Text Settings"' in lines[i]:
                    break
                else:
                    i += 1
            continue

        # ============================================================
        # LOAD_IMAGE_PARAMS SWITCH (vertex shader)
        # ============================================================
        if 'case 0: LOAD_IMAGE_PARAMS(0, p);' in line:
            # Generate image_count - 1 cases (last becomes default)
            for n in range(image_count - 1):
                result.append(f'                    case {n}: LOAD_IMAGE_PARAMS({n}, p); break;')

            # Skip remaining cases (1-30)
            i += 1
            while i < len(lines) and 'LOAD_IMAGE_PARAMS' in lines[i] and 'default:' not in lines[i]:
                i += 1

            # Handle default case
            if 'default: LOAD_IMAGE_PARAMS' in lines[i]:
                result.append(f'                    default: LOAD_IMAGE_PARAMS({image_count - 1}, p); break;')
                i += 1
            continue

        # ============================================================
        # DECLARE_TEXT_VARS SECTION (CGPROGRAM)
        # ============================================================
        if '//ifex _Use0==0' in line and i + 1 < len(lines) and 'DECLARE_TEXT_VARS(0)' in lines[i + 1]:
            # Generate text_count DECLARE_TEXT_VARS blocks
            for n in range(text_count):
                result.append(f'            //ifex _Use{n}==0')
                result.append(f'            DECLARE_TEXT_VARS({n})')
                result.append(f'            //endex')

            # Skip remaining DECLARE_TEXT_VARS (1-31)
            i += 3  # Skip the first block
            while i < len(lines):
                if '//ifex _Use' in lines[i] and 'DECLARE_TEXT_VARS' in lines[i + 1]:
                    i += 3
                elif '// ============' in lines[i] or 'v2f vert' in lines[i]:
                    break
                else:
                    i += 1
            result.append('')  # Empty line
            continue

        # ============================================================
        # LOAD_TEXT_PARAMS SWITCH (vertex shader)
        # ============================================================
        if '//ifex _Use0==0' in line and i + 1 < len(lines) and 'case 0: LOAD_TEXT_PARAMS(0, p);' in lines[i + 1]:
            # Generate text_count LOAD_TEXT_PARAMS cases
            for n in range(text_count):
                result.append(f'                    //ifex _Use{n}==0')
                result.append(f'                    case {n}: LOAD_TEXT_PARAMS({n}, p); break;')
                result.append(f'                    //endex')

            # Skip remaining LOAD_TEXT_PARAMS cases (1-31)
            i += 3  # Skip the first block
            while i < len(lines):
                if '//ifex _Use' in lines[i] and 'LOAD_TEXT_PARAMS' in lines[i + 1]:
                    i += 3
                elif 'default: break;' in lines[i]:
                    result.append(lines[i])
                    i += 1
                    break
                else:
                    i += 1
            continue

        # Default: copy line as-is
        result.append(line)
        i += 1

    return '\n'.join(result)


def main():
    parser = argparse.ArgumentParser(description='Typography Shader Slot Count Reducer')
    parser.add_argument('--image', type=int, default=DEFAULT_IMAGE_COUNT,
                        help=f'Number of image slots (default: {DEFAULT_IMAGE_COUNT})')
    parser.add_argument('--text', type=int, default=DEFAULT_TEXT_COUNT,
                        help=f'Number of text slots (default: {DEFAULT_TEXT_COUNT})')
    parser.add_argument('--backup', action='store_true',
                        help='Create backup before modifying')
    parser.add_argument('--dry-run', action='store_true',
                        help='Print stats without writing file')

    args = parser.parse_args()

    if not SHADER_PATH.exists():
        print(f"Error: Shader not found at {SHADER_PATH}")
        return 1

    print(f"Reading shader from {SHADER_PATH}...")
    original = SHADER_PATH.read_text(encoding='utf-8')
    original_lines = original.count('\n')

    print(f"Processing: {args.image} images, {args.text} texts...")
    output = process_shader(original, args.image, args.text)
    output_lines = output.count('\n')

    print(f"  Original: {original_lines:,} lines")
    print(f"  Output:   {output_lines:,} lines")
    print(f"  Reduced:  {original_lines - output_lines:,} lines ({(1 - output_lines/original_lines)*100:.1f}%)")

    if args.dry_run:
        print("\nDry run - no files modified")
        return 0

    if args.backup and not BACKUP_PATH.exists():
        print(f"Creating backup at {BACKUP_PATH}...")
        BACKUP_PATH.write_text(original, encoding='utf-8')

    SHADER_PATH.write_text(output, encoding='utf-8')
    print(f"Shader written to {SHADER_PATH}")
    return 0


if __name__ == '__main__':
    exit(main())
