# Auto-watch script that monitors _config.yml and restarts server when needed
# This script keeps the server running and auto-restarts when config changes

# Refresh environment variables
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "=== Jekyll Auto-Watch Server ===" -ForegroundColor Green
Write-Host "Server will auto-restart when _config.yml changes" -ForegroundColor Yellow
Write-Host "Press Ctrl+C to stop`n" -ForegroundColor Yellow

# Check Ruby
try {
    $rubyVersion = ruby --version 2>&1
    Write-Host "[OK] Ruby: $rubyVersion" -ForegroundColor Green
} catch {
    Write-Host "[ERROR] Cannot find Ruby" -ForegroundColor Red
    exit 1
}

# Function to start server
function Start-JekyllServer {
    Write-Host "`n[$(Get-Date -Format 'HH:mm:ss')] Starting Jekyll server..." -ForegroundColor Cyan
    $process = Start-Process -FilePath "bundle" -ArgumentList "exec", "jekyll", "serve", "-l", "-H", "localhost" -NoNewWindow -PassThru -RedirectStandardOutput "jekyll.log" -RedirectStandardError "jekyll_error.log"
    return $process
}

# Function to stop server
function Stop-JekyllServer {
    Get-Process | Where-Object {$_.ProcessName -eq "ruby"} | Stop-Process -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 2
}

# Start server initially
$serverProcess = Start-JekyllServer
$configFile = "_config.yml"
$lastWriteTime = (Get-Item $configFile).LastWriteTime

Write-Host "[OK] Server started. Monitoring $configFile for changes..." -ForegroundColor Green
Write-Host "Access: http://localhost:4000`n" -ForegroundColor Cyan

# Monitor config file
try {
    while ($true) {
        Start-Sleep -Seconds 3
        
        # Check if config file changed
        $currentWriteTime = (Get-Item $configFile).LastWriteTime
        if ($currentWriteTime -ne $lastWriteTime) {
            Write-Host "`n[$(Get-Date -Format 'HH:mm:ss')] Config file changed! Restarting server..." -ForegroundColor Yellow
            Stop-JekyllServer
            Start-Sleep -Seconds 2
            $serverProcess = Start-JekyllServer
            $lastWriteTime = $currentWriteTime
            Write-Host "[OK] Server restarted`n" -ForegroundColor Green
        }
        
        # Check if server process is still running
        if ($serverProcess.HasExited) {
            Write-Host "`n[$(Get-Date -Format 'HH:mm:ss')] Server stopped unexpectedly. Restarting..." -ForegroundColor Red
            $serverProcess = Start-JekyllServer
        }
    }
} finally {
    Write-Host "`nStopping server..." -ForegroundColor Yellow
    Stop-JekyllServer
}

