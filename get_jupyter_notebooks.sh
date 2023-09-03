#!/bin/bash

set -e

current_user=$(whoami)

source /home/$current_user/anaconda3/bin/activate
# ^ VENV ACTIVATOR

cd ./.py
python get_notebooks_one_folder_back.py
cd ../

for notebook in *.ipynb; do
    [ -f "$notebook" ] || break
    jupyter trust $notebook
done

echo

# sleep 11
