# Setup Instructions

Follow the steps below to set up your development environment and start contributing to the AAIE unified dataset.

---

## 1. Fork the Repository

Go to the original GitHub repository and click the **"Fork"** button at the top-right corner. This will create a personal copy of the repository under your GitHub account.

Then clone your forked repository locally:

```bash
git clone https://github.com/<your-username>/aaie-data-hub.git
cd aaie-data-hub
```

---

## 2. Set Up Python Virtual Environment

```bash
python3 -m venv venv
source venv/bin/activate  # or use `venv\Scripts\activate` on Windows
pip install -r requirements.txt
```

---

## 3. Configure Environment Variables

Create a `.env` file using the template provided:

```bash
cp .env.example .env
```

Then add your OpenAI API key (or others as needed):

```env
OPENAI_API_KEY=your-key-here
```

---

## 4. Validate Your JSON Entry

Use the provided validation script to check that your curated dataset file complies with the schema.

```bash
python scripts/validation/validate_json.py data/curated/your_file.json
```

---

## 5. Submit a Pull Request

Before submitting:
- Make sure your file is in the `data/raw/` folder if not curated, or in `data/curated/` if it is curated.
- Follow naming conventions and schema
- Push changes to your forked repo
- Open a Pull Request to the main repository

---

## You're Ready!

Thank you for contributing to the AAIE project. For any issues, reach out to the Data Curation team.