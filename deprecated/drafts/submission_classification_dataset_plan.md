# Submission Classification Dataset

## 1. Objectives of the Dataset

The main purpose of the `submission_classification.csv` dataset is to act as a resource for training, evaluating, and conducting research on an AI detection model. This dataset is specifically designed for classification tasks where each row, which represents a student submission, is independent. The simple tabular format of the dataset makes it suitable for use with machine learning libraries like Pandas, Scikit-learn, and HuggingFace.

## 2. Requirements of the Dataset

The `submission_classification.csv` dataset must follow these schema and content requirements:

* **Format:** CSV (Comma Separated Values).
* **Core Fields (Mandatory):** Every submission must include these fields:
    * `submission_id`: A unique string to identify each submission.
    * `submission_text`: The full text of the student's submission.
    * `origin_label`: A string that indicates the origin of the submission, with acceptable values being "human" or "ai".
    * `submission_type`: A string that specifies the type of submission, such as "essay" or "short_answer".
    * `subject_domain`: A string that indicates the academic subject area, for example, "psychology," "law," "business," or "stem".
    * `timestamp`: A string representing the date and time the submission was created.
* **Optional Fields:**
    * `prompt_id`: A string that references the prompt or rubric used for the submission.
    * `generated_tool`: A string that identifies the specific AI tool used, if applicable, such as "ChatGPT" or "Claude".
* **Data Balance:** The dataset should aim for a balanced representation of `origin_label` values ("human", "ai") for effective training of the AI detection model.

## 3. Roadmap: Week 4 to Week 8

### Week 4: Demo Version Delivery & Core Setup

* **Objective:** To deliver a small, working demo version of `submission_classification.csv` that shows the core schema and data types. This demo should be sufficient for running basic classification experiments.
* **Deliverable:** `submission_classification_demo.csv` and a brief document explaining its contents and how it was generated.

### Week 5: Scaling Up "Human" & "AI" Data Collection

* **Objective:** To significantly increase the volume and diversity of "human" and "AI" submissions.
* **Tasks:**
    * Expand the prompt library by creating a larger and more varied set of academic prompts.
    * Increase the number of "Synthetic Human-Written Student Work" submissions.
    * Refine scripts to automatically generate a larger volume of "AI-Generated Responses" using multiple large language models (LLMs) and various parameters.
    * Ensure `prompt_id` and `generated_tool` are consistently captured.
    * Enhance validation scripts to catch schema errors as data volume grows.

### Week 6: Data Enrichment & Quality Review

* **Objective:** To add more detailed metadata to the dataset and begin a systematic quality review.
* **Tasks:**
    * Ensure all entries are accurately and consistently timestamped.
    * Start a systematic review of a sample of the collected data to check for quality and adherence to definitions.

### Week 7: Data Balancing, Cleaning, and Initial Analysis

* **Objective:** To focus on balancing the dataset across `origin_label`, `submission_type`, and `subject_domain`, and to perform a thorough data cleaning.
* **Tasks:**
    * Assess the current distribution of `origin_label`, `submission_type`, and `subject_domain` in the dataset.
    * Plan and execute targeted data generation to fill gaps and improve balance.
    * Conduct comprehensive data cleaning, including removing duplicates, handling malformed text or metadata, and standardizing text.
    * Perform an initial exploratory data analysis to generate basic statistics that will help inform future collection efforts.

### Week 8: Finalization, Documentation, and Versioning

* **Objective:** To finalize the dataset, create comprehensive documentation, and establish proper versioning.
* **Tasks:**
    * Designate a specific version of `submission_classification.csv` as ready for initial model training/evaluation.
    * Create detailed documentation for the dataset, including schema definition, generation methods, data distribution statistics, ethical considerations, and known limitations.
    * Integrate the finalized dataset and documentation into a version control system.
    * Run final validation checks to ensure data integrity and adherence to the schema.

## 4. Detailed Process with Tech Stacks and Data Storage

The data collection and curation for `submission_classification.csv` will follow a structured process using specific technologies.

### A. Data Generation & Initial Capture:

* **Synthetic Human-Written Student Work:**
    * **Process:** Project members will provide submissions with clear context, which will be used as prompts for the AI-generated content. They will typically submit their work folders in a Google Drive Shared Drive. For code submissions, GitHub could be used.
    * **Tech Stack:**
        * Google Forms/Google Docs for text submission and collaboration.
        * Python (Pandas) for initial ingestion from Google Sheets exports or parsing text files.
        * GitHub for managing code submissions and versioning student work.
* **AI-Generated Responses:**
    * **Process:** Automated scripts will generate responses to a predefined set of prompts using various LLMs and will also capture relevant metadata.
    * **Tech Stack:**
        * Python as the primary scripting language.
        * OpenAI Python Client Library for GPT models.
        * Anthropic Python Client Library for Claude models.
        * Hugging Face `transformers` library for interacting with open-source LLMs.
        * `requests` library for interacting with other LLM APIs.
        * Jupyter Notebooks/Python Scripts for developing and executing the generation logic.

### B. Data Curation & Processing:

* **Process:** Raw data will be cleaned, transformed, and merged into the `submission_classification.csv` schema. This includes standardizing text, ensuring consistent labeling, and handling optional fields.
* **Tech Stack:**
    * Python (Pandas) as the core library for data manipulation and transformation.
    * NLTK / SpaCy for basic text processing.
    * Custom Python Scripts for specific cleaning rules and validation checks.

### C. Data Storage & Versioning:

* **Raw Data Storage:**
    * Google Drive Shared Drive for initial storage of raw human-written and AI-generated content.

### Week 4 Detailed Task List (Demo Version Delivery)

* **Objective:** Deliver `submission_classification_demo.csv` with 50-100 entries, including "human" and "ai" labels, formatted correctly for basic AI detection experiments.
* **Tasks:**
    * **Define Demo Scope (Day 1):** Select a few diverse short academic prompts, identify 2 core `submission_type` values, and identify 2-3 `subject_domain` values.
    * **Rapid Human Data Generation (Days 1-2):** Team members will submit their own work from before 2023. A shared Google Drive folder or Google Form will be used for collection. The expected output is 25-50 raw human-written text files.
    * **Rapid AI Data Generation (Days 2-3):** A Python script will be developed to call 1-2 selected LLM APIs using the exact same prompts as the human writers. The script will loop through the prompts to generate 25-50 AI responses and capture `generated_tool` metadata.
    * **Initial Data Ingestion & Transformation (Days 3-4):** A Python script using Pandas will read the human and AI text files. The script will assign `submission_id`, `origin_label`, `submission_type`, `subject_domain`, `timestamp`, `prompt_id`, and `generated_tool` to each entry. The expected output is a preliminary Pandas DataFrame that follows the schema.
    * **Basic Data Validation & Export (Day 4):** A Python script will implement basic validation checks to verify mandatory fields, check `origin_label` values, and check for empty text content. The validated DataFrame will then be saved to `submission_classification_demo.csv`.

By the end of Week 4, the team will have `submission_classification_demo.csv` ready for initial experimentation.