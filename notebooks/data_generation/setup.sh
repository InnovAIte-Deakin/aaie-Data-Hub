#!/bin/bash

# Setup script for AI-content Collector project

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv venv
    echo "Virtual environment created."
else
    echo "Virtual environment already exists."
fi

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Install requirements
echo "Installing required packages..."
pip install -r requirements.txt

# Add virtual environment to Jupyter kernel
echo "Adding virtual environment to Jupyter kernel..."
python -m ipykernel install --user --name=ai-collector --display-name="AI Collector (venv)"

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "Creating .env file from template..."
    cp .env.example .env
    echo "Please edit .env file to add your API keys."
else
    echo ".env file already exists."
fi

echo "Setup complete! Virtual environment is activated."
echo "Run 'jupyter notebook' to start the notebook server."
