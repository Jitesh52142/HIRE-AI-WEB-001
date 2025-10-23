# PowerShell script to push Hire AI app to GitHub
Write-Host "========================================" -ForegroundColor Green
Write-Host "    Pushing Hire AI App to GitHub" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

# Navigate to the project directory
$projectPath = "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"
Set-Location $projectPath

Write-Host "`nCurrent directory: $(Get-Location)" -ForegroundColor Yellow
Write-Host ""

# Check if git is initialized
if (-not (Test-Path ".git")) {
    Write-Host "Initializing git repository..." -ForegroundColor Yellow
    git init
    Write-Host ""
}

# Add all files
Write-Host "Adding all files to git..." -ForegroundColor Yellow
git add .

# Check git status
Write-Host "`nGit status:" -ForegroundColor Yellow
git status

# Commit changes
Write-Host "`nCommitting changes..." -ForegroundColor Yellow
git commit -m "Update: Fixed pandas version for Vercel deployment and added .gitignore"

# Check if remote exists
Write-Host "`nChecking remote repository..." -ForegroundColor Yellow
$remoteExists = git remote -v 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "`nNo remote repository found!" -ForegroundColor Red
    Write-Host "Please run these commands manually:" -ForegroundColor Red
    Write-Host ""
    Write-Host "1. Create a new repository on GitHub" -ForegroundColor White
    Write-Host "2. Add remote: git remote add origin https://github.com/YOUR_USERNAME/hire-ai-web-app.git" -ForegroundColor White
    Write-Host "3. Push: git push -u origin main" -ForegroundColor White
    Write-Host ""
    Read-Host "Press Enter to continue"
    exit 1
}

# Push to GitHub
Write-Host "`nPushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "    Push completed successfully!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Read-Host "Press Enter to continue"
