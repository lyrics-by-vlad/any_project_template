#!/bin/bash

set -e

users_list=$(users)
current_user=${users_list[0]}

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
