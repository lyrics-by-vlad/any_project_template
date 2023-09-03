@echo off

call %USERPROFILE%\anaconda3\Scripts\activate.bat
:: ^ VENV ACTIVATOR

cd ./.py
python get_notebooks_one_folder_back.py
cd ../

for %%f in (*.ipynb) do jupyter trust %%f

:: ping -n 11 127.0.0.1 > nul
