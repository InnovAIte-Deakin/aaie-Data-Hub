# Contributor Guide

Welcome to the **AAIE Unified Dataset** project! This guide provides instructions for contributing high-quality JSON entries that simulate how students use LLMs like ChatGPT to complete academic essay tasks.

---

## What You'll Be Doing

Each contributor is responsible for creating complete data entries that include:
- A well-defined academic prompt and rubric
- Simulated LLM questions and answers
- Student-style essay submissions across five quality bands
- Rubric-based feedback

---

## File Structure

Each JSON file should follow the unified schema and be placed in:

```
data/curated/your_file.json
```

Use examples in the `samples/` folder as a reference.

---

## How to Contribute

### 1. Fork and Clone the Repository

Follow the [setup instructions](../setup_instructions.md) to fork, clone, and prepare your environment.

---

### 2. Create a New JSON File

Use a text editor or script to generate a new file based on the schema. Each file must contain:

- `domain`
- `prompt`
- `rubric` (with clear criteria and descriptors)
- `submissions` list:
  - Five submission levels (Excellent, Good, Average, Needs Improvement, Poor)
  - Each must include:
    - `llm_questions`
    - `llm_answers`
    - `final_submission`
    - `feedback` per rubric criterion

---

### 3. Validate Your File

Run the validation script:

```bash
python scripts/validation/validate_json.py data/curated/your_file.json
```

Fix any errors or warnings before continuing.

---

### 4. Submit a Pull Request

- Push your validated file to your forked repo
- Open a pull request to the main repo
- Make sure your file is peer-reviewed (2 peer reviews required, 1 senior reviewer required)

---

## Tips for High-Quality Entries

- Align LLM questions with key rubric points
- Vary tone and structure across quality levels
- Use realistic student phrasing (especially for lower quality)
- Ensure academic tone in high-quality submissions
- Reference examples in `samples/` if unsure

---

## Thank You

We appreciate your contribution to this academic research project. For any questions, reach out to your domain lead or the Data Curation team.