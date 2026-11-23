#!/usr/bin/env bash
# Builds one upload-ready ZIP per skill in dist/, for the Claude desktop app's
# "Upload a skill" flow. Each ZIP bundles its own copy of SHEET-FORMAT.md,
# because uploaded skills can't reach files outside their own folder.
set -euo pipefail
cd "$(dirname "$0")/.."
rm -rf dist build && mkdir -p dist build
for dir in skills/*/; do
  name=$(basename "$dir")
  cp -r "$dir" "build/$name"
  cp reference/SHEET-FORMAT.md "build/$name/SHEET-FORMAT.md"
  sed -i.bak 's#\.\./\.\./reference/SHEET-FORMAT\.md#SHEET-FORMAT.md#g' "build/$name/SKILL.md"
  rm -f "build/$name/SKILL.md.bak"
  (cd build && zip -qr "../dist/$name.zip" "$name")
done
rm -rf build
ls dist
