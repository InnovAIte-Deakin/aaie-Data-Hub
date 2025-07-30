# AAIE Unified Dataset for AI-Influenced Assignments

This repository is part of the **Artificial Assessment Intelligence for Educators (AAIE)** capstone project at Deakin University. The goal is to build a high-quality unified dataset that simulates how students use Large Language Models (LLMs) like ChatGPT to complete academic tasks.

---

## Project Overview

Each dataset entry includes:
- An assignment prompt and detailed rubric
- Simulated student questions to the LLM
- LLM answers (representing AI support)
- A final student-style essay (Excellent to Poor quality)
- Feedback based on the rubric

This structure allows researchers to analyze:
- AI usage patterns in academic writing
- Prompt design and essay development
- The relationship between AI interaction and submission quality

---

## Folder Structure
```bash
aaie-data-hub/
├── data/
│ ├── raw/ # Unstructured or unprocessed files
│ ├── curated/ # Final JSON files per rubric
│ ├── samples/ # Sample entries for reference
│ └── schema/ # Unified JSON schema and validators
│
├── scripts/
│ ├── openai_generation/ # Scripts to generate questions/answers via API
│ ├── quality_generation/ # Scripts to simulate low/high quality answers
│ └── validation/ # Schema validation tools
│
├── notebooks/ # Analysis, QA, and visualisation notebooks
│
├── docs/
│ ├── schema_guides/ # Schema documentation
│ ├── contributor_guide.md # Instructions for contributors
│ └── README.md # Additional documentation
│
├── requirements.txt # Python dependencies
├── .env.example # API key placeholder
├── setup_instructions.md # How to set up the project
└── README.md # You are here
```
---

## Contribution Workflow

1. Choose a domain and design a rubric + prompt
2. Simulate LLM questions/answers using our scripts
3. Write/Simulate a student-style submission using the AI support
4. Repeat for 5 quality levels: Excellent → Poor
5. Validate and push to `curated/` with a pull request

All contributions are reviewed to ensure schema compliance and dataset consistency.

---

## Supported Domains (As of July 2025)

- Information Technology
- Engineering
- Psychology
- Accounting
- Teaching

---

## Setup & Validation

See [`setup_instructions.md`](./setup_instructions.md) for environment setup and JSON validation steps.

---

## Maintainers

Led by the **Data Curation Pillar** as part of the AAIE capstone under the School of IT.