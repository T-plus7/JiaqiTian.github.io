# Jekyll 本地开发环境配置脚本
# 适用于 Windows PowerShell

Write-Host "=== Jekyll 本地开发环境配置 ===" -ForegroundColor Green

# 检查 Ruby 是否安装
Write-Host "`n检查 Ruby 安装..." -ForegroundColor Yellow
try {
    $rubyVersion = ruby --version 2>&1
    Write-Host "✓ Ruby 已安装: $rubyVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Ruby 未安装" -ForegroundColor Red
    Write-Host "`n请先安装 Ruby:" -ForegroundColor Yellow
    Write-Host "1. 访问 https://rubyinstaller.org/" -ForegroundColor Cyan
    Write-Host "2. 下载并安装 Ruby+Devkit (推荐版本 3.1.x 或更高)" -ForegroundColor Cyan
    Write-Host "3. 安装完成后重新运行此脚本" -ForegroundColor Cyan
    exit 1
}

# 检查 Bundler 是否安装
Write-Host "`n检查 Bundler 安装..." -ForegroundColor Yellow
try {
    $bundleVersion = bundle --version 2>&1
    Write-Host "✓ Bundler 已安装: $bundleVersion" -ForegroundColor Green
} catch {
    Write-Host "✗ Bundler 未安装，正在安装..." -ForegroundColor Yellow
    gem install bundler
}

# 配置 bundle 使用本地路径（避免权限问题）
Write-Host "`n配置 Bundle 使用本地路径..." -ForegroundColor Yellow
bundle config set --local path 'vendor/bundle'
Write-Host "✓ 配置完成" -ForegroundColor Green

# 安装依赖
Write-Host "`n安装 Jekyll 依赖（这可能需要几分钟）..." -ForegroundColor Yellow
bundle install
if ($LASTEXITCODE -eq 0) {
    Write-Host "✓ 依赖安装完成" -ForegroundColor Green
} else {
    Write-Host "✗ 依赖安装失败，请检查错误信息" -ForegroundColor Red
    exit 1
}

Write-Host "`n=== 配置完成！ ===" -ForegroundColor Green
Write-Host "`n现在可以运行以下命令启动本地服务器:" -ForegroundColor Yellow
Write-Host "  .\start.ps1" -ForegroundColor Cyan
Write-Host "`n或者直接运行:" -ForegroundColor Yellow
Write-Host "  bundle exec jekyll serve -l -H localhost" -ForegroundColor Cyan

