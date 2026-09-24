#!/usr/bin/env bash
# Rendert een flyer-HTML-bestand naar een PNG op ware grootte (1080x1350px).
# Gebruik: scripts/render-flyer.sh flyers/<naam>.html flyers/<naam>.png
set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Gebruik: $0 <input.html> <output.png>" >&2
  exit 1
fi

INPUT="$(realpath "$1")"
OUTPUT="$2"

chromium \
  --headless \
  --disable-gpu \
  --no-sandbox \
  --hide-scrollbars \
  --window-size=1080,1350 \
  --screenshot="$OUTPUT" \
  "file://$INPUT"

echo "Geschreven: $OUTPUT"
