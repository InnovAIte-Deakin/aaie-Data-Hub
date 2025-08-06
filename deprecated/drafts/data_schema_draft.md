# Schema Draft v1 for AAIE Data Curation Team
# \[DEPRECATED\] CURRENT SCHEMA CAN BE FOUND IN [`data/schema`](../../data/schema/) FOLDER

This document presents the first draft of the dataset schema for training, evaluating, and researching AI-assisted writing models. The dataset consists of three components:

- **Submission Classification dataset** `submission classification.csv` – for AI detection  
- **Feedback Annotation dataset** `feedback annotation.json` – for training feedback generation models  
- **Revision Chain dataset** `revision chain.json` – for modeling AI-human collaboration and misuse detection  

---

## Dataset 1: `submission classification.csv`

### Why use CSV and not JSON?

- Simple tabular structure: each row corresponds to one submission  
- Ideal for classification tasks where rows are independent  
- Easier to integrate with libraries like `pandas`, `scikit-learn`, `HuggingFace`, etc.

### Schema

| Field Name      | Type     | Description                                                         |
|-----------------|----------|---------------------------------------------------------------------|
| `submission_id` | string   | Unique identifier for the submission                                |
| `submission_text` | string | Full text of the student submission                                 |
| `origin_label`  | string   | Label: `"human"`, `"ai"`, or `"hybrid"`                             |
| `prompt_id`     | string   | (Optional) Reference to the prompt/rubric used                      |
| `submission_type` | string | Type of submission: `"essay"`, `"short answer"`, etc.               |
| `subject_domain` | string  | Domain: `"psychology"`, `"law"`, `"business"`, `"STEM"`, etc.       |
| `token_count`   | integer  | Length of the submission in tokens                                  |
| `generated_tool` | string  | (Optional) AI tool used: `"ChatGPT"`, `"Claude"`, etc.              |
| `timestamp`     | string   | Date/time the submission was created                                |

---

## Dataset 2: `feedback annotation.json`

### Why use JSON and not CSV?

- Contains nested data for rubrics, feedback categories, and multi-criterion grading  
- JSON allows clear nesting of rubric criteria and annotations

### Schema

```json
{
  "submission_id": "sub_001",
  "prompt": "Write an essay discussing ...",
  "submission_text": "Here is the full student essay or answer ...",
  "rubric": {
    "rubric_id": "rub_001",
    "criteria": [
      {
        "criterion_id": "c1",
        "name": "Argument clarity",
        "description": "Does the essay present a clear argument?",
        "max_score": 5,
        "score": 4,
        "feedback": "Strong argument, though lacking evidence in second half."
      },
      {
        "criterion_id": "c2",
        "name": "Structure",
        "description": "Is the essay well structured?",
        "max_score": 5,
        "score": 5,
        "feedback": "Excellent structure with clear transitions."
      }
    ]
  },
  "overall_grade": "Distinction",
  "final_comment": "A well-written, structured essay with a clear argument."
}
```

### Training Examples

- Input: Submission text + Rubric → Output: Feedback  
- Input: Submission text + Rubric + Criterion → Output: Per-criterion feedback

---

## Dataset 3: `revision chain.json`

### Why use JSON and not CSV?

- Multi-step editing and revision data requires structured nesting  
- Each chain contains multiple drafts, edits, and comments—too complex for a flat CSV

### Schema

```json
{
  "chain_id": "rev_001",
  "prompt": "Discuss the ethical implications of AI in healthcare.",
  "revisions": [
    {
      "step": 1,
      "author": "ai",
      "text": "AI in healthcare raises questions about ...",
      "comment": null,
      "timestamp": "2025-07-15T10:00:00Z"
    },
    {
      "step": 2,
      "author": "human",
      "text": "AI in healthcare introduces concerns, especially in privacy ...",
      "comment": "Refined intro, added specifics.",
      "timestamp": "2025-07-15T10:20:00Z"
    },
    {
      "step": 3,
      "author": "human",
      "text": "AI systems in healthcare must address privacy, bias, and responsibility ...",
      "comment": "Final polish.",
      "timestamp": "2025-07-15T10:40:00Z"
    }
  ],
  "final_submission": "AI systems in healthcare must address privacy, bias, and responsibility ..."
}
```

### Use Cases

- Model the flow of AI-assisted writing  
- Study human effort vs. AI output  
- Detect misuse (e.g., minimal edits) and provide process-based feedback  
- Link final output to `feedback annotation.json` via `submission_id`