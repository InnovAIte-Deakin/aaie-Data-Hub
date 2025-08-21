# Validation Script

This folder contains a standalone Python script used to validate JSON files for the AAIE Unified Dataset project. The script checks each file for correctness, naming conventions, and domain consistency based on a defined schema.

This version is intended for **local use only**. It does not include GitHub Actions or continuous integration (CI).

---

## Purpose

This script ensures that every JSON file inside `data/curated/` is properly structured and ready for submission. Running this locally helps contributors catch errors before opening a pull request.

---

## Features

- Validates against the official JSON Schema (`data/schema/schema.json`)
- Ensures:
  - `rubric_id` matches filename
  - `rubric_id` follows pattern: `rub_<domain>_<4-digit>`
  - Domain consistency between `domain` and `rubric_id`
  - All required fields are present
  - No extra fields are included
  - `rubric_id` is lowercase

---

## How to Use

### 1. Install Python and dependencies

Create a virtual environment and install requirements:

```bash
python -m venv venv
venv\Scripts\activate        # Windows
# or
source venv/bin/activate       # macOS/Linux

pip install -r requirements.txt
```

Your `requirements.txt` should contain:

```
jsonschema==4.17.3
```

---

### 2. Validate all JSON files in a folder

```bash
python scripts/validation/validate_json.py data/curated
```

### 3. Validate a single file

```bash
python scripts/validation/validate_json.py data/curated/rub_psychology_0001.json
```

The script will print validation results and exit with code `0` (pass) or `1` (fail).

---

## Example Errors and Fixes

### Filename mismatch

**Filename:** `rub_psych_0001.json`  
**rubric_id:** `rub_psychology_0001`  
**Fix:** Rename file to match `rubric_id`.

---

### rubric_id not lowercase

**rubric_id:** `rub_Psychology_0001`  
**Fix:** Change to `rub_psychology_0001`

---

### Domain mismatch

**domain:** `Psychology`  
**rubric_id:** `rub_sociology_0001`  
**Fix:** Change `rubric_id` to match domain → `rub_psychology_0001`

---

### Missing required field (llm_answers)

**Fix:** Add `"llm_answers"` array with at least one string element.

---

### Extra field not allowed

```json
{
  "domain": "Psychology",
  "prompt": "Explain something",
  "unexpected_field": "This should be removed"
}
```

**Fix:** Remove any fields not defined in the schema.

---

## Notes

- The schema is located at: `data/schema/schema.json`
- The validator script is located at: `scripts/validation/validate_json.py`
- File validation is strict to ensure dataset quality and uniformity

---

Maintained by the Data Curation Team.
