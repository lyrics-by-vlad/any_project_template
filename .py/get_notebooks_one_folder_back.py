import os
import sys
from subprocess import run
from glob import glob
from shutil import move, rmtree
try:
    import jupytext
except ModuleNotFoundError:
    sys.exit(
        "Please, install jupytext to your current environment with the following command \n\n"
        "                   pip install jupytext\n"
        "OR, for example, \n"
        "                   poetry add jupytext\n"
    )

# convert to .ipynb all .py files in the current directory into a temporary ipynb folder

name_of_temp_ipynb_folder = 'ipynb'

run(
    'jupytext --to "{name_of_temp_ipynb_folder}//ipynb" *.py', 
    executable=('/bin/bash' if 'linux' in sys.platform else None), 
    shell=True, 
    check=True
)

# define directories needed further

path_to_current_folder = os.getcwd()

path_to_temp_ipynb_folder = os.path.join(
    path_to_current_folder, 
    name_of_temp_ipynb_folder
)

path_to_temp_ipynb_files = os.path.join(
    path_to_current_folder, 
    name_of_temp_ipynb_folder, 
    '*.ipynb'
)

# identify this script converted and delete it
path_to_current_script_converted = os.path.join(
    path_to_current_folder, 
    name_of_temp_ipynb_folder, 
    os.path.basename(sys.argv[0]).replace('.py', '.ipynb')
)
os.remove(path_to_current_script_converted)

# remove scripts that do not need to be converted to ipynb
# os.remove(os.path.join(path_to_temp_ipynb_folder, 'a_converted_script_to_delete.ipynb'))

# move received .ipynb files from ipynb temporary folder
# to the directory before the one where the original .py files are
for old_path_to_file in list(glob(path_to_temp_ipynb_files)):
  file_name = os.path.basename(old_path_to_file)
  new_path_to_file = f'../{file_name}'
  move(old_path_to_file, new_path_to_file)

# delete temporary ipynb folder
rmtree(path_to_temp_ipynb_folder)

# delete the folder with autosaves from the directory where the notebooks were saved, if it exists
if os.path.exists(os.path.abspath('../.ipynb_checkpoints')):
    rmtree(os.path.abspath('../.ipynb_checkpoints'))

print('\nYOUR SCRIPTS ARE SUCCESSFULLY CONVERTED INTO JUPYTER NOTEBOOKS!')
print('You can find them in the following path\n')
print(os.path.abspath('../'), '\n', sep='')
