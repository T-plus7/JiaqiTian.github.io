# Jekyll Local Development Server Startup Script
# Access http://localhost:4000 after startup

# Refresh environment variables to ensure Ruby can be found
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "=== Starting Jekyll Local Development Server ===" -ForegroundColor Green
Write-Host "`nServer will be available at: http://localhost:4000" -ForegroundColor Yellow
Write-Host "Press Ctrl+C to stop the server`n" -ForegroundColor Yellow

# Check if Ruby is available
try {
    $rubyVersion = ruby --version 2>&1
    Write-Host "[OK] Ruby: $rubyVersion" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Cannot find Ruby. Please ensure Ruby is properly installed." -ForegroundColor Red
    exit 1
}

# Check if dependencies are installed
if (-not (Test-Path "vendor/bundle")) {
    Write-Host "Dependencies not found. Running setup script..." -ForegroundColor Yellow
    .\setup.ps1
    if ($LASTEXITCODE -ne 0) {
        exit 1
    }
}

# Start Jekyll server
# -l enables live reload
# -H localhost binds to localhost
Write-Host "Starting server..." -ForegroundColor Yellow
bundle exec jekyll serve -l -H localhost
