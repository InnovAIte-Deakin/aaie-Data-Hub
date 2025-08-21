@echo off
REM Setup script for AI-content Collector project

REM Create virtual environment if it doesn't exist
IF NOT EXIST venv (
    echo Creating virtual environment...
    python -m venv venv
    echo Virtual environment created.
) ELSE (
    echo Virtual environment already exists.
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat

REM Install requirements
echo Installing required packages...
pip install -r requirements.txt

REM Add virtual environment to Jupyter kernel
echo Adding virtual environment to Jupyter kernel...
python -m ipykernel install --user --name=ai-collector --display-name="AI Collector (venv)"

REM Create .env file if it doesn't exist
IF NOT EXIST .env (
    echo Creating .env file from template...
    copy .env.example .env
    echo Please edit .env file to add your API keys.
) ELSE (
    echo .env file already exists.
)

echo Setup complete! Virtual environment is activated.
echo Run 'jupyter notebook' to start the notebook server.
pause
