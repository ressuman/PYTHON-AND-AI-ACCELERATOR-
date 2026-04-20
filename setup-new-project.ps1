Write-Host "Running full project setup..."

# Register kernels
Write-Host "Step 1: Registering kernels..."
.\register-kernels.ps1

# Setup VS Code settings
Write-Host "Step 2: Setting up VS Code interpreter configs..."
.\setup-vscode.ps1

Write-Host "Setup complete!"
