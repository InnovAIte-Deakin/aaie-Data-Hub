#!/usr/bin/env bash
set -euo pipefail
if [ ! -d ".venv" ]; then
  echo "No .venv found. Create one with: python3 -m venv .venv && source .venv/bin/activate && pip install -r requirements.txt"
  exit 1
fi
source .venv/bin/activate
for f in data/rubrics/*.json; do
  [ -e "$f" ] || continue
  echo "Validating $f"
  python scripts/validate_json.py "$f"
done
