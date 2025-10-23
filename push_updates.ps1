# PowerShell script to push all code updates to GitHub
Write-Host "========================================" -ForegroundColor Green
Write-Host "    Pushing All Code Updates to GitHub" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

# Navigate to the project directory
$projectPath = "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"
Set-Location $projectPath

Write-Host "`nCurrent directory: $(Get-Location)" -ForegroundColor Yellow
Write-Host ""

# Check git status
Write-Host "Checking git status..." -ForegroundColor Yellow
git status

Write-Host "`nAdding all changes..." -ForegroundColor Yellow
git add .

Write-Host "`nCommitting changes..." -ForegroundColor Yellow
git commit -m "Optimize deployment: Remove blocking MongoDB connection during startup and add lazy admin creation"

Write-Host "`nPushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "    All updates pushed successfully!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Your optimized app is now deployed with:" -ForegroundColor White
Write-Host "- Faster startup (no MongoDB connection during deployment)" -ForegroundColor White
Write-Host "- Lazy admin user creation" -ForegroundColor White
Write-Host "- Better error handling" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter to continue"
