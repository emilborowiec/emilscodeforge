set-variable projdir ..\EmilsCodeforge\EmilsCodeforge.Web
set-variable distdir c:\temp

$ErrorActionPreference = "Stop"

dotnet publish -c Release $projdir

if ($LASTEXITCODE -eq 0) {
    write-output "publish ok"
} else {
    write-output "publish error"
    pause
    exit
}

if (Test-Path $distdir\forge) {
    remove-item $distdir\forge -Recurse
}
copy-item $projdir\bin\Release\netcoreapp3.1\publish $distdir\forge -Recurse -Force
Write-Output "copied"
compress-archive $distdir\forge $distdir\forge.zip -Force
Write-Output "compressed"
remove-item $distdir\forge -Recurse
Write-Output "cleaned up"
