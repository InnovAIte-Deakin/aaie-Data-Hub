# Python Virtual Environment (venv) — Setup & Test (Mac + Windows)

## macOS (zsh/bash)
```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
# test with your repo script + sample JSON (adjust if paths differ)
if [ -f scripts/validate_json.py ]; then S="scripts/validate_json.py";
elif [ -f scripts/validation/validate_json.py ]; then S="scripts/validation/validate_json.py";
else echo "validator script not found"; exit 1; fi
if   [ -f data/curated/psychology_0111.json ]; then J="data/curated/psychology_0111.json";
elif [ -f data/psychology_0111.json ]; then J="data/psychology_0111.json";
else echo "sample JSON not found"; exit 1; fi
python "$S" "$J"
deactivate

