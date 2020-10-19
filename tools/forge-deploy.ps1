Set-Variable archive ~\downloads\forge.zip
Set-Variable appsdir C:\webapps
Set-Variable website emilscodeforge

Stop-Website $website
if (Test-Path $appsdir\forge) {
    Remove-Item $appsdir\forge -Recurse -Force
}
Expand-Archive $archive $appsdir
Start-Website $website
