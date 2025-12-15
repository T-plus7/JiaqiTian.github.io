# Jekyll Server Restart Script
# Use this after modifying _config.yml

# Refresh environment variables to ensure Ruby can be found
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "=== Restarting Jekyll Server ===" -ForegroundColor Green

# Stop existing Jekyll processes
Write-Host "`nStopping existing server..." -ForegroundColor Yellow
Get-Process | Where-Object {$_.ProcessName -eq "ruby"} | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

# Check if Ruby is available
try {
    $rubyVersion = ruby --version 2>&1
    Write-Host "[OK] Ruby: $rubyVersion" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Cannot find Ruby. Please ensure Ruby is properly installed." -ForegroundColor Red
    exit 1
}

# Start server
Write-Host "Starting server..." -ForegroundColor Yellow
Write-Host "`nServer will be available at: http://localhost:4000" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop the server`n" -ForegroundColor Yellow

bundle exec jekyll serve -l -H localhost
