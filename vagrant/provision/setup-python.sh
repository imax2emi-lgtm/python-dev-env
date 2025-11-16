#!/bin/bash

# Install pyenv
echo "Installing pyenv..."
curl https://pyenv.run | bash

# Set up environment variables
export PATH="/home/vagrant/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# Install Python versions
echo "Installing Python versions..."
pyenv install 3.9.18
pyenv install 3.10.12
pyenv install 3.11.4
pyenv install 3.12.0

# Set global Python version
pyenv global 3.11.4

# Install pipx for managing Python applications
echo "Installing pipx..."
python -m pip install --user pipx
python -m pipx ensurepath

# Install useful Python tools
echo "Installing Python development tools..."
pipx install black
pipx install flake8
pipx install mypy
pipx install poetry
pipx install pre-commit
pipx install cookiecutter

# Create virtual environments for common use cases
echo "Creating virtual environments..."
pyenv virtualenv 3.11.4 data-science
pyenv virtualenv 3.11.4 web-dev
pyenv virtualenv 3.11.4 automation

# Install common packages in virtual environments
echo "Installing common packages..."
pyenv activate data-science
pip install numpy pandas matplotlib jupyter scikit-learn
pyenv deactivate

pyenv activate web-dev
pip install flask django fastapi requests beautifulsoup4
pyenv deactivate

pyenv activate automation
pip install requests selenium pyautogui psutil
pyenv deactivate

# Create project template structure
mkdir -p /home/vagrant/shared/projects/template/{src,tests,docs,data}
cat > /home/vagrant/shared/projects/template/README.md << 'EOF'
# Project Template

This is a Python project template.

## Structure
- src/ - Source code
- tests/ - Test files
- docs/ - Documentation
- data/ - Data files

## Setup
```bash
python -m venv venv
source venv/bin/activate
pip install -r requirements.txt