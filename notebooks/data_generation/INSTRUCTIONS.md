# AI Content Collector - Setup and Usage Instructions

## 1. Initial Setup

### 1.1 API Keys Setup

You need to obtain API keys for the AI models you want to use:

#### OpenAI (ChatGPT) API Key
1. Visit [OpenAI's platform](https://platform.openai.com/account/api-keys)
2. Create an account or log in to your existing account
3. Navigate to the API keys section
4. Click "Create new secret key"
5. Copy the generated key

#### Google Gemini API Key
0. Go to [Google Cloud Console](https://console.cloud.google.com) and create a new project
1. Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
2. Create an account or log in with your Google account
3. Click "Get API key" in the menu
4. Create a new API key
5. Copy the generated key

### 1.2 Set Up Virtual Environment

This project uses a virtual environment to isolate dependencies:

```bash
# Option 1: Run the automated setup script
# On macOS/Linux
./setup.sh

# On Windows
setup.bat

# Option 2: Manual setup
# Create virtual environment
python -m venv venv

# Activate on macOS/Linux
source venv/bin/activate

# Activate on Windows
# venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Add the virtual environment to Jupyter kernel
python -m ipykernel install --user --name=ai-collector --display-name="AI Collector (venv)"
```

### 1.3 Add Virtual Environment to Jupyter Kernel

To ensure your notebook uses the correct Python environment:

1. **Install ipykernel** (if not already installed):
   ```bash
   pip install ipykernel
   ```

2. **Add your virtual environment as a Jupyter kernel**:
   ```bash
   python -m ipykernel install --user --name=ai-collector --display-name="AI Collector (venv)"
   ```

3. **Select the correct kernel in Jupyter**:
   - Open your notebook in Jupyter
   - Go to "Kernel" → "Change Kernel" → "AI Collector (venv)"
   - Or in VS Code: Click on the kernel selector in the top right and choose "AI Collector (venv)"

4. **Verify the kernel is working**:
   ```python
   import sys
   print(sys.executable)  # Should show path to your venv Python
   ```

### 1.4 Configure API Keys

Create a `.env` file in the project root directory with your API keys:

```
# .env file - Never commit this to version control
OPENAI_API_KEY=your_openai_api_key_here
GEMINI_API_KEY=your_gemini_api_key_here
```

You can copy the template from `.env.example`:
```bash
cp .env.example .env
# Then edit .env with your actual keys
```

### 1.5 Directory Structure

Ensure your project has the following structure:
```
Dataset_Transform/
├── config.py         # API keys configuration
├── scraper.ipynb     # Main collector script
├── prompt.txt        # Template prompt
└── data/             # Input JSON files folder
```

## 2. Preparing Input Data

### 2.1 Customize the Prompt Domain

The `prompt.txt` file contains the template used to generate responses. By default, it's configured for the "engineering" domain. To customize it for your specific domain:

1. **Open the `prompt.txt` file** in any text editor
2. **Locate the domain reference** - look for mentions of "engineering" in the prompt
3. **Replace with your target domain**, for example:
   - Change "engineering" to "computer science"
   - Change "engineering" to "business"
   - Change "engineering" to "mathematics"
   - Or any other domain relevant to your use case
4. **DO NOT DELETE THE [file to write] PART. IT IS WHERE YOUR JSON FILE IS PLACED**

**Example**:
```
# Before (in prompt.txt)
...evaluate this engineering problem...

# After (for computer science domain)
...evaluate this computer science problem...
```

### 2.2 Create Input Files

1. Create a folder named `data` if it doesn't exist already:
   ```bash
   mkdir -p data
   ```

2. Place your JSON files in this folder `data`


## 3. Running the Collector

### 3.1 Launch the Jupyter Notebook

Open the `scraper.ipynb` notebook:
```bash
jupyter notebook scraper.ipynb
```

Or open it in VS Code:
```bash
code scraper.ipynb
```

### 3.2 Run the Collector

Execute the cells in the notebook. To generate responses using different models:

```python
# For ChatGPT
gpt_collector = ChatGPTCollector()
gpt_collector.batch_generate('prompt.txt', 'data')

# For Gemini
gemini_collector = GeminiCollector()
gemini_collector.batch_generate('prompt.txt', 'data')
```

### 3.3 Parameters Explanation

- `prompt.txt`: Path to the prompt template file
- `data`: Directory containing input JSON files

## 4. Output Files

After running the collector:

1. Generated files will have the naming pattern: `original_filename_final.json`
2. Raw responses are saved as `original_filename_raw.txt` for debugging

## 5. Validating Output

You can validate the output files to ensure they follow the expected schema:

```python
# Validate a single file
result = validate_schema("path/to/output_file.json", "sample_dataset.json")

# Validate all files in the output directory
results = validate_directory("output_directory", "sample_dataset.json")
```

## 6. Troubleshooting

### Common Issues:

1. **API Key Errors**:
   - Verify your API keys in `config.py` are correct and not expired
   - Check that your account has sufficient credits/quota

2. **Import Errors**:
   - Make sure all required packages are installed:
     ```bash
     pip install openai google-generativeai pandas numpy
     ```
   - Restart the kernel if you've recently modified `config.py`

3. **File Not Found Errors**:
   - Ensure paths are correct and files exist
   - Check that `prompt.txt` and input files are in the expected locations

4. **Rate Limiting**:
   - If you encounter rate limit errors, increase the delay in the collector initialization:
     ```python
     gpt_collector = ChatGPTCollector(delay=2.0)  # 2-second delay between requests
     ```

5. **Domain Mismatch Issues**:
   - Ensure the domain in your `prompt.txt` matches the domain in your input JSON files
   - Check that all references to domain-specific terminology are consistent
   - If responses seem off-topic, verify the domain customization in the prompt
