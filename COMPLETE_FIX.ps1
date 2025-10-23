# Complete Fix for Vercel Internal Server Error
Write-Host "========================================" -ForegroundColor Green
Write-Host "    COMPLETE FIX - Resolve Vercel Error" -ForegroundColor Green
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

Write-Host "`nCommitting Werkzeug compatibility fix..." -ForegroundColor Yellow
git commit -m "COMPLETE FIX: Pin Werkzeug version to resolve url_quote import error on Vercel"

Write-Host "`nPushing to GitHub..." -ForegroundColor Yellow
git push origin main

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "    COMPLETE FIX DEPLOYED!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "What was fixed:" -ForegroundColor White
Write-Host "- Pinned Werkzeug to version 2.x (Werkzeug>=2.2.2,<3.0)" -ForegroundColor White
Write-Host "- This prevents the url_quote import error" -ForegroundColor White
Write-Host "- Vercel will now use compatible Werkzeug version" -ForegroundColor White
Write-Host "- Added comprehensive error handling" -ForegroundColor White
Write-Host "- Added health check endpoint" -ForegroundColor White
Write-Host ""
Write-Host "Next steps:" -ForegroundColor White
Write-Host "1. Wait 1-2 minutes for Vercel to redeploy" -ForegroundColor White
Write-Host "2. Test: https://hire-ai-web-001.vercel.app/health" -ForegroundColor White
Write-Host "3. Test: https://hire-ai-web-001.vercel.app/" -ForegroundColor White
Write-Host "4. Your app should work perfectly now!" -ForegroundColor White
Write-Host ""
Write-Host "If you still get errors, check Vercel logs for any remaining issues." -ForegroundColor Yellow
Write-Host ""
Read-Host "Press Enter to continue"
