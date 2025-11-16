
## 3. Host Machine Setup Script

### `scripts/host-setup.ps1`
```powershell
# Host Setup Script for Windows
Write-Host "Setting up Python Development Environment on Windows Host..." -ForegroundColor Green

# Check if Vagrant is installed
try {
    $vagrantVersion = vagrant --version
    Write-Host "Vagrant found: $vagrantVersion" -ForegroundColor Green
} catch {
    Write-Host "Vagrant not found. Please install Vagrant from https://www.vagrantup.com/downloads" -ForegroundColor Red
    exit 1
}

# Check if VirtualBox is installed
try {
    $vboxVersion = VBoxManage --version
    Write-Host "VirtualBox found: $vboxVersion" -ForegroundColor Green
} catch {
    Write-Host "VirtualBox not found. Please install VirtualBox from https://www.virtualbox.org/wiki/Downloads" -ForegroundColor Red
    exit 1
}

# Create necessary directories
$directories = @(
    "shared\projects",
    "shared\scripts",
    "shared\data",
    "vagrant"
)

foreach ($dir in $directories) {
    if (!(Test-Path $dir)) {
        New-Item -ItemType Directory -Force -Path $dir
        Write-Host "Created directory: $dir" -ForegroundColor Yellow
    }
}

# Create a sample Python project in shared folder
$sampleProject = @"
#!/usr/bin/env python3
"""
Sample Python Project
Running in Vagrant Ubuntu VM with shared folder
"""

def main():
    print("Hello from Python in Vagrant VM!")
    print("This file is synchronized between host and VM")
    
    # Demonstrate some Python features
    numbers = [1, 2, 3, 4, 5]
    squares = [x**2 for x in numbers]
    print(f"Numbers: {numbers}")
    print(f"Squares: {squares}")

if __name__ == "__main__":
    main()
"@

$sampleProject | Out-File -FilePath "shared\projects\hello_vagrant.py" -Encoding UTF8

# Create a requirements.txt file
$requirements = @"
# Python Development Requirements
black>=23.0.0
flake8>=6.0.0
mypy>=1.0.0
pytest>=7.0.0
pytest-cov>=4.0.0

# Data Science
numpy>=1.24.0
pandas>=2.0.0
matplotlib>=3.7.0
jupyter>=1.0.0

# Web Development
flask>=2.3.0
requests>=2.31.0
beautifulsoup4>=4.12.0

# Utilities
psutil>=5.9.0
python-dotenv>=1.0.0
"@

$requirements | Out-File -FilePath "vagrant\requirements.txt" -Encoding UTF8

# Create useful host scripts
$startScript = @"
#!/bin/bash
echo "Starting Python development environment..."
cd vagrant
vagrant up python-dev
echo "VM is starting up. Use 'vagrant ssh python-dev' to connect."
"@

$startScript | Out-File -FilePath "start-dev.ps1" -Encoding UTF8

$stopScript = @"
#!/bin/bash
echo "Stopping development environment..."
cd vagrant
vagrant halt
echo "All VMs stopped."
"@

$stopScript | Out-File -FilePath "stop-dev.ps1" -Encoding UTF8

Write-Host "Host setup completed!" -ForegroundColor Green
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Navigate to 'vagrant' directory" -ForegroundColor White
Write-Host "2. Run 'vagrant up' to start the VMs" -ForegroundColor White
Write-Host "3. Run 'vagrant ssh python-dev' to connect to development VM" -ForegroundColor White