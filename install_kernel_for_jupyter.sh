#!/bin/bash

set -e

current_user=$(whoami)

project_dir_name=$(basename "$PWD")

poetry_envs=$(poetry env list)
poetry_envs_list=($poetry_envs)
poetry_env=${poetry_envs_list[0]}

if [[ ${poetry_env//" "/""} = "" ]]; then
    echo -e "\nCan't find poetry env for this project :("
    echo "Use 'poetry shell' command before running this script"
    exit 1
fi

source "/home/$current_user/.cache/pypoetry/virtualenvs/$poetry_env/bin/activate"
# ^ POETRY'S VENV ACTIVATOR

echo -e "$poetry_env has been activated\n"

read -p "Do you really want to install new ipykernel for $current_user (user) in $project_dir_name (project)? (Y|N) " y_or_not_y

if [[ "${y_or_not_y,,}" = "y" ]]; then
    
    read -p "Specify the name of the kernel (default on enter is $project_dir_name) " kernel_name
    
    if [[ ${kernel_name//" "/""} = "" ]]; then
        kernel_name=$project_dir_name
    else
        kernel_name=${kernel_name//"'"/""}
        kernel_name=${kernel_name//'"'/''}
    fi
    
    python_version=$(python -V)
    python_version=${python_version//'Python '/'py'}
    display_name="$kernel_name-$python_version-poetry"
    
    if [[ ${python_version//" "/""} = "" ]]; then
        echo -e "\nCan't find Python in this env :("
    else
        
        echo
        poetry add -G dev ipykernel
        ipykernel_installation_output=$(poetry run python -m ipykernel install --name $kernel_name --display-name $display_name --sys-prefix --env PYDEVD_DISABLE_FILE_VALIDATION 1)
        path_to_kernel="/${ipykernel_installation_output#*/}"
        
        base_bath_to_conda="/home/$current_user/anaconda3"
        if [ -d "$base_bath_to_conda" ]; then
            jupyter kernelspec install $path_to_kernel --prefix "$base_bath_to_conda" --name "$kernel_name"
        else
            jupyter kernelspec install $path_to_kernel --user --name "$kernel_name"
        fi
    
    fi

elif ! [[ "${y_or_not_y,,}" = "n" ]]; then
    echo "'$y_or_not_y' interpreted as answer 'no'"
fi

echo
