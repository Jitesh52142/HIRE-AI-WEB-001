# PowerShell script to fix Werkzeug compatibility error
Write-Host "========================================" -ForegroundColor Green
Write-Host "    Fixing Werkzeug Compatibility Error" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green

# Navigate to the project directory
$projectPath = "C:\Users\DELL\OneDrive\画像\Desktop\old projects\Hire AI\HIRE-AI-WEB-001"
Set-Location $projectPath

Write-Host "`nCurrent directory: $(Get-Location)" -ForegroundColor Yellow
Write-Host ""

# Check git status
Write-Host "Checking git status..." -ForegroundColor Yellow
git status

Write-Host "`nAdding Werkzeug compatibility fix..." -ForegroundColor Yellow
git add requirements.txt

Write-Host "`nCommitting fix..." -ForegroundColor Yellow
git commit -m "Fix Werkzeug compatibility: Pin Werkzeug version to prevent url_quote import error"

Write-Host "`nPushing fix to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "    Werkzeug fix pushed!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "What was fixed:" -ForegroundColor White
Write-Host "- Added Werkzeug>=2.2.2,<3.0 to requirements.txt" -ForegroundColor White
Write-Host "- This prevents the url_quote import error" -ForegroundColor White
Write-Host "- Vercel will now use compatible Werkzeug version" -ForegroundColor White
Write-Host ""
Write-Host "Next steps:" -ForegroundColor White
Write-Host "1. Wait for Vercel to redeploy (1-2 minutes)" -ForegroundColor White
Write-Host "2. Test: https://your-app.vercel.app/health" -ForegroundColor White
Write-Host "3. Your app should now work!" -ForegroundColor White
Write-Host ""
Read-Host "Press Enter to continue"
