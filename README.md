# The project can be useful
As a part of your personal template/scheme for a python project if you want to work with its `.py` files (presented here in '.py' directory), especially edit them as `.ipynb` files, through Jupyter Notebook in a proper way. There is provided a way (bash script) to integrate with your virtual environment realised through Poetry (as well as with standard venv soon).
  
# Usage (tested on Linux and Windows)
At first, just clone or download this repository.  

1. Let's say all your python scripts of a project are in the same directory '.py'. And this '.py' directory is located in the root of the project.
2. So, put `get_notebooks_one_folder_back.py` file into the '.py' directory and `get_jupyter_notebooks.sh` file into the root of the project.
3. Now you can run `get_jupyter_notebooks.sh` to get converted `.py` files into `.ipynb` files which would be placed in the root of the project. And of course these `.ipynb` files are available to be opened in Jupyter Notebook IDE.
   
   > **If you want to update (rewrite) related `.py` file automatically at every time you save your changes in its `.ipynb` file from Jupyter Notebook**, just follow the 1 simple step from my [another repository](https://github.com/lyrics-by-vlad/jupyter_best_configs) which is very similar to this one in terms of the goals it pursues.
   
   > By default it is assumed that you have installed anaconda3 into your home directory as one (and of course not necessarily the main) of your virtual environments holder, but **you can change the venv activator just by replacing the following line of code in `get_jupyter_notebooks.sh` file**:
   ```
   source /home/$current_user/anaconda3/bin/activate
   # ^ VENV ACTIVATOR
   ```
Once you have got notebooks from python scripts, you most likely want to get link right to the project's environment (python interpreter) in kernels list in Jupyter Notebook IDE, to work from this with its dependencies:
![changing_kernel](https://github.com/lyrics-by-vlad/py_project_template/assets/48052299/e3a13688-d563-497f-b73c-a5dcec58b82c)
To achieve this, just put `install_kernel_for_jupyter.sh` file into the root of the project, run it and then relaunch Jupyter Notebook.  

> For now it works only for virtual environments by Poetry, but soon with standard venv too.
