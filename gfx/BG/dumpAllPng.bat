@echo off

for %%f in (*.png) do (
  dumpPng.exe %%~f %%~nf.dmp %%~nfPal.dmp
)
pause