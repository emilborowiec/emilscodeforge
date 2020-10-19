@echo off
set projdir=..\EmilsCodeforge\EmilsCodeforge.Web\
set distdir=c:\temp\

dotnet publish -c Release %projdir%

if %errorlevel% equ 0 (echo publish ok) else (
echo publish error
pause
exit
)

tar -czf %distdir%forge.tar.gz %projdir%\bin\Release\netcoreapp3.1\publish

if %errorlevel% equ 0 (echo tar ok) else (
echo tar error
pause
exit
)