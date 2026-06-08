#!/usr/bin/env bash
set -euo pipefail

URL="${1:-}"

if [[ -z "$URL" ]]; then
  echo "Usage: ./generate-qr.sh \"https://YOUR_USERNAME.github.io/QR/\""
  exit 1
fi

if ! command -v qrencode &>/dev/null; then
  echo "qrencode is not installed."
  echo "  macOS:  brew install qrencode"
  echo "  Ubuntu: sudo apt install qrencode"
  exit 1
fi

OUTPUT="qr-code.svg"
qrencode -o "$OUTPUT" -t SVG -s 6 -m 2 "$URL"

echo "QR code saved to $OUTPUT"
echo "URL encoded: $URL"
