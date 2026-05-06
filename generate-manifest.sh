#!/bin/bash
# Generates images.json from the images/ folder.
# Run this whenever you add or remove images.

cd "$(dirname "$0")"
ls images/*.jpg images/*.jpeg images/*.png images/*.gif images/*.webp images/*.avif images/*.svg 2>/dev/null \
  | sed 's|^images/||' \
  | sort \
  | python3 -c "import sys,json; print(json.dumps([l.strip() for l in sys.stdin]))" \
  > images.json

echo "images.json updated ($(python3 -c "import json; print(len(json.load(open('images.json'))))"
) images)"
