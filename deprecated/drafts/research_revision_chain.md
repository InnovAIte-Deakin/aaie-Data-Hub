# AAIE Dataset Research: `revision_chain.json`
# \[DEPRECATED\] CURRENT DOCUMENTATION CAN BE FOUND IN [`docs/schema_guides`](../../docs/schema_guides/) FOLDER
## Objective

To build a high-quality, ethics-safe `revision_chain.json` dataset that simulates realistic and diverse revision sequences. These will be used to **train and evaluate LLMs** capable of understanding **collaborative writing** and **possible AI misuse**.

---

## Roadmap Summary

We will **not generate revision chain data yet**. This dataset depends on having a complete rubric + prompt collection first (Phase 1).

Once we have that, we will:

1. Use prompts + rubrics to generate AI-written drafts  
2. Apply prompt engineering to simulate realistic human-like revisions (repeated 2+ times)  
3. Mix with real human revision chains (from research datasets) to ensure realism and balance  

---

## Datasets to Collect in Phase 1

| Dataset              | Size             | Features                                     | License                | Access                          |
|----------------------|------------------|----------------------------------------------|------------------------|----------------------------------|
| **IteraTeR (GitHub)**| 8,000+ revisions | Human-written, step-by-step edits, metadata  | Academic               | Need permission – contact Week 3–4 |
| **Re3-Sci (UKPLab)** | Scientific edits | Peer-reviewed, structured edits              | Apache 2.0 (Permissive)| Available                        |
| **ArgRewrite (GitHub)** | Argumentative essays | Draft + feedback annotations         | Public                 | Available                        |

We aim to convert at least **300–500 real revision chains** into our target format, **if permitted**.

---

## Each `revision_chain` Entry Will Follow This Structure:

```json
{
  "chain_id": "rev_001",
  "prompt": "Your writing prompt here...",
  "revisions": [
    {
      "step": 1,
      "author": "ai",
      "text": "First AI-generated draft...",
      "comment": null,
      "timestamp": "2025-07-15T10:00:00Z"
    },
    {
      "step": 2,
      "author": "human",
      "text": "Human-edited version...",
      "comment": "Clarified argument in paragraph 2.",
      "timestamp": "2025-07-15T10:20:00Z"
    }
  ],
  "final_submission": "Final edited submission text..."
}
```

---

## Phase 2 – How We'll Build It (Week 5 Onwards)

### 1. **Synthetic Revision Chain Creation**

Once rubric-prompt pairs are ready:

- **Step 1**: Generate AI submission  
  - **Input**: Prompt + Rubric summary  
  - **Output**: AI Draft (step 1, `author: "ai"`)

- **Step 2–3**: Use OpenAI again with prompt-engineered instructions  
  - e.g., *"Revise the AI-generated draft to make it more nuanced and human-like with a natural tone…"*

- Simulate:
  - Grammar fixes
  - Structural improvements
  - Tone changes

- Add:
  - Structured comments
  - Timestamps to simulate real drafting behavior

---

### 2. **Real Human Revision Chains**

In parallel with synthetic generation, we will:

- Integrate real revision sequences from public/open datasets
- Build a script to:
  - Clone and parse each dataset’s revision structure
  - Extract:
    - Prompt
    - Drafts (usually 2–3 per sample)
  - Assign fields like:
    - `step`
    - `author`: `"human"`
    - `text`: full draft
    - `comment`: revision goal or annotator note
  - Structure into `revision_chain.json`
  - Validate using internal schema

---

## Possible GitHub Structure

```
/aaie-github/
├── raw_data/
│   ├── human_revision/
│   │   ├── argrewrite/
│   │   ├── iterater/
│   │   └── re3/
│   └── human_submission/
│       └── DREsS/
│
├── processed_data/
│   └── revision_chains/
│       └── revision_chain.json
│
├── scripts/
│   └── convert_to_schema/
│       ├── argrewrite_parser.py
│       ├── re3_parser.py
│       └── schema_validator.py
│
└── docs/
    ├── revision_schema.md
    ├── dataset_sources.md
    └── README.md
```

---

## Week 3–4 Actions / Tasks

- [ ] Finalise and approve this schema internally  
- [ ] Contact IteraTeR, Re3-Sci, and ArgRewrite authors for permission to reuse/cite  
- [ ] Document prompt templates for AI-to-human revision simulation  
- [ ] Wait for Phase 1 rubric completion before generating synthetic samples  
