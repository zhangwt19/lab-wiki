This tutorial is for setting up [jupyterlab](https://jupyterlab.readthedocs.io/en/stable/) on discovery (Dartmouth's HPC cluster).

## 1. Install conda

`wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh`

## 2. Install jupyterlab

`conda install -c conda-forge jupyterlab`

## 3. Start jupyterlab

sbatch jupyter.sh

wait a few seconds, it will create a file called jupyter-notebook.err.

## 4. Connect from local computer

on local computer, create ssh tunneling.

`ssh -NfL 8888:$node:8888 f0052zm@discovery.dartmouth.edu`

$node can be obtained from the 2nd url from jupyter-notebook.err, like `http://k10:8888/lab?token=8d1e300f945f5c76d8e576cac9b233a29a04683ce6401144`. the number before 8888 is the node number, in this case it is  `k10`.

## 5. Open browser

copy paste the url from jupyter-notebook.err 

## Tips 

modify --time in jupyter.sh to a longer time so that you can have the server up for a longer period.