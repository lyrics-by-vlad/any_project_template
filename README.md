# The project can be useful
As a part of your personal template/scheme for a python project if you want to work with its `.py` files (presented here in '.py' directory), especially edit them as `.ipynb` files, through Jupyter Notebook in a proper way.  
There is provided a way (bash script) to integrate with your virtual environment realised through Poetry.
  
# Usage (tested on Linux and Windows)
At first, just clone or download this repository.  

1. Let's say all your Python scripts of a project are in the same directory '.py'. And this '.py' directory is located in the root of the project.
2. So, put `get_notebooks_one_folder_back.py` file into the '.py' directory and `get_jupyter_notebooks.sh` file in the root of the project.
3. Now you can run `get_jupyter_notebooks.sh` to get converted `.py` files into `.ipynb` files which would be placed in the root of the project. And of course you can open them in Jupyter Notebook IDE.
   
   > Note: **if you want to update related `.py` file automatically at every time you save your `.ipynb` file from Jupyter Notebook** IDE, just follow the first simple step from my [another repository](https://github.com/lyrics-by-vlad/jupyter_best_configs) which is very similar to this one in terms of the goals it pursues.
