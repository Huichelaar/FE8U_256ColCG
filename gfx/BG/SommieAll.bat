@echo off

for %%f in (*.png) do (
  Sommie.exe %%~f %%~nf.dmp %%~nfPal.dmp
)
pause