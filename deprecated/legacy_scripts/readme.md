#  Summary Report: GenAI Dataset Cleaning and Balancing Pipeline (Week 3)

**Script Title:** Automated Data Cleaning and Balancing Pipeline for GenAI Submissions
**Language:** Python 3
**Dependencies:** `pandas`, `numpy`, `json`, `openpyxl`, `datetime`
**Compatible File Types:** `.csv`, `.xlsx`, `.json`

---

##  Purpose

This Python script automates the preprocessing and validation of GenAI submission datasets. It ensures that all entries meet standards of quality, completeness, and format before being used in downstream machine learning or analytical workflows. The pipeline is modular, scalable, and aligned with data engineering best practices.

---

##  Key Functionalities

The script performs comprehensive data cleaning and balancing by:

*  Validating and standardizing timestamps to ISO 8601 format
*  Assigning unique `submission_id` values
*  Auto-computing missing `token_count` based on word length of submission text
*  Ensuring origin labels are strictly either `'human'` or `'ai'`
*  Balancing class distribution to mitigate model bias
*  Removing records with missing critical fields

---

##  Core Functions Overview

| Function              | Description                                                 |
| --------------------- | ----------------------------------------------------------- |
| `load_data()`         | Loads input from `.csv`, `.xlsx`, or `.json` formats        |
| `clean_data()`        | Applies rules for validation, cleaning, and standardization |
| `update_timestamps()` | Converts and normalizes timestamps; fills missing values    |
| `assign_unique_ids()` | Generates unique IDs where missing or duplicated            |
| `balance_data()`      | Balances dataset between 'human' and 'ai' classes           |
| `save_data()`         | Exports the cleaned dataset in the desired format           |

---

##  Key Features and Deliverables

* **Data Quality Assurance:** Malformed or incomplete entries are corrected or dropped
* **Unique ID Enforcement:** Every record has a non-null, unique `submission_id`
* **Timestamp Normalization:** Timestamps standardized to ISO 8601
* **Token Count Auto-Fill:** Automatically computes token count if missing
* **Class Balancing:** Enables balanced class labels to support fair training
* **Flexible Output:** Supports export to `.csv`, `.xlsx`, or `.json` formats

---

##  Output Example (Console Log)

```
Cleaned data written to: cleaned_dataset.json  
Final shape: (1150, 8)  
Now, ALL rows have a unique non-null submission_id, valid timestamp, and required features.
```

---

##  Technical Summary

A robust preprocessing pipeline was developed for the GenAI submission dataset to clean, validate, balance, and export data across multiple formats. The script enforces schema integrity, normalizes timestamps, balances class distributions, and enhances data readiness for machine learning applications.

