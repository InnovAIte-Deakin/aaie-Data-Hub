**Python Virtual Environment (venv) — Setup & Test Guide (Windows & Mac)**

*Project: AAIE — Data Curation & Generation Last updated: 2025-08-19*

This guide will help you set up a clean Python environment to run our **data-generation notebook** and the **rubric JSON validator** (validate\_json.py).![ref1]

0) **Prerequisites**

Before you begin, ensure you have the following:

- **Python 3.10+** installed
  - Check version on Mac: python3 --version
  - Check version on Windows: py --version or python --version
- Git (optional, but recommended)
- Your project folder should contain:
  - requirements.txt
  - validate\_json.py
  - rub\_Psychology\_0011.json (rubric dataset)
  - .env.example (API key template for data generation)
  - scraper.ipynb (optional, for data generation)![](Aspose.Words.051954ac-9cec-430b-9d2b-05695201940f.002.png)
1) **Create & Activate a Virtual Environment**

**Mac / Linux**

1. Navigate to your project folder:
1. cd aaie-data
1. Create a virtual environment:
1. python3 -m venv .venv
1. Activate the virtual environment:
1. source .venv/bin/activate
- Your shell prompt should now start with (.venv).

**Windows (PowerShell or CMD)**

1. Navigate to your project folder:
1. cd aaie-data
3. Create a virtual environment:
3. py -m venv .venv
3. Activate the virtual environment:
3. .venv\Scripts\activate
- Your prompt should now show (.venv).

To deactivate the virtual environment at any time, use: deactivate

2) **Install Dependencies**

With the virtual environment activated, update pip and install the necessary packages:

pip install --upgrade pip

pip install -r requirements.txt

**Requirements in requirements.txt include:**

- **openai**
- **google-generativeai**
- **python-dotenv==1.0.0**
- **requests==2.31.0**
- **pandas==2.2.0**
- **numpy==1.26.3**
- **jupyter==1.0.0**
- **ipykernel==6.29.0**

**Tip for Mac M-series:** If you encounter build errors, try: pip install --no-cache-dir -r requirements.txt

3) **Configure API Keys (Optional, for data-generation)**
   1. Copy the example environment file:
      1. Mac/Linux: cp .env.example .env
      1. Windows: copy .env.example .env
   1. Edit the .env file and paste your API keys:
   1. OPENAI\_API\_KEY=sk-xxxx GEMINI\_API\_KEY=xxxx
4) **Sanity Test (Imports + Versions)**

To ensure everything is set up correctly, run this inside the virtual environment:

python - << 'PY'

import sys, importlib print("Python:", sys.version)

for p in ["openai","google.generativeai","dotenv","requests","pandas","numpy"]:     try:

`        `m = importlib.import\_module(p)

`        `v = getattr(m, "\_\_version\_\_", "n/a")

`        `print("OK  -", p, "version=", v)

`    `except Exception as e:

`        `print("ERR -", p, "->", e)

PY

- You should see OK for each package.
5) **Validate a Rubric Dataset**

With the virtual environment active, validate your JSON file:

for example:

python validate\_json.py rub\_Psychology\_0011.json

**Expected Output:**

JSON is valid.

- If something is wrong, the validator will print which field is missing/invalid.
6) **Run the Data-Generation Notebook (Optional)**

**Local Jupyter**

1. Start Jupyter Notebook:
1. jupyter notebook
1. Open scraper.ipynb, select the .venv kernel, and run the cells.

**VS Code**

1. Install “Python” & “Jupyter ” extensions.
1. Open scraper.ipynb, select the .venv kernel, and run.
7) **Common Issues**
- **command not found: python3** → Install Python 3 from python.org.
- **source: no such file or directory** → Ensure .venv exists.
- **Package build errors on Mac** → Run xcode-select --install then re-run pip.
- **Wrong kernel in Jupyter** → Switch to .venv in Notebook UI.![ref1]

 **Quick Checklist**

- [.venv created & activated]
- [pip install -r requirements.txt successful]
- [.env file created (if using data generation)]
- [Sanity test passes]
- [validate\_json.py returns JSON is valid]
- [(Optional) Notebook runs in .venv]

**Maintainer:** Dhruv Hiren Surti — Data Curation & Generation

[ref1]: Aspose.Words.051954ac-9cec-430b-9d2b-05695201940f.001.png
