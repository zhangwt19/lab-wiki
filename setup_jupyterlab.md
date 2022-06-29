### Tutorial for setting up [jupyterlab](https://jupyterlab.readthedocs.io/en/stable/) on polaris/andes (Dartmouth's HPC clusters). Set-up on discovery is located in the bottom section. 

## 1. Create/Use a Jupyter-enabled Conda environment 

```
$ conda create --name jupyter python=3.7 anaconda
$ conda activate jupyter
```
The `anaconda` package contains `jupyter`, `pip`, `pandas` and other modules.

OR use provided 'global' environment:

```
$ conda env list
$ conda activate anaconda3
```

## 2. Start Jupyter Lab (or Notebook) on HPC 

```
(anaconda3) $ jupyter lab --no-browser 
```
Here's a sample output (if successful):

```
[I 2022-06-29 12:58:37.366 ServerApp] jupyterlab | extension was successfully linked.
[I 2022-06-29 12:58:37.398 ServerApp] Writing notebook server cookie secret to /dartfs-hpc/rc/home/b/f005d5b/.local/share/jupyter/runtime/jupyter_cookie_secret
[I 2022-06-29 12:58:49.657 ServerApp] nbclassic | extension was successfully linked.
[I 2022-06-29 12:58:50.355 ServerApp] The port 8888 is already in use, trying another port.
[I 2022-06-29 12:58:50.356 ServerApp] The port 8889 is already in use, trying another port.
[I 2022-06-29 12:58:50.561 LabApp] JupyterLab extension loaded from /dartfs-hpc/rc/home/b/f005d5b/.conda/envs/polyfun/lib/python3.7/site-packages/jupyterlab
[I 2022-06-29 12:58:50.561 LabApp] JupyterLab application directory is /dartfs-hpc/rc/home/b/f005d5b/.conda/envs/polyfun/share/jupyter/lab
[I 2022-06-29 12:58:50.583 ServerApp] jupyterlab | extension was successfully loaded.
[I 2022-06-29 12:58:50.775 ServerApp] nbclassic | extension was successfully loaded.
[I 2022-06-29 12:58:50.775 ServerApp] Serving notebooks from local directory: /dartfs-hpc/rc/home/b/f005d5b
[I 2022-06-29 12:58:50.775 ServerApp] Jupyter Server 1.4.1 is running at:
[I 2022-06-29 12:58:50.775 ServerApp] http://localhost:8890/lab?token=39d31967164428e397358c100fe85b319df6cb1e0dbfe172
[I 2022-06-29 12:58:50.775 ServerApp]  or http://127.0.0.1:8890/lab?token=39d31967164428e397358c100fe85b319df6cb1e0dbfe172
[I 2022-06-29 12:58:50.775 ServerApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 2022-06-29 12:58:50.823 ServerApp] 
    
    To access the server, open this file in a browser:
        file:///dartfs-hpc/rc/home/b/f005d5b/.local/share/jupyter/runtime/jpserver-62379-open.html
    Or copy and paste one of these URLs:
        http://localhost:8890/lab?token=39d31967164428e397358c100fe85b319df6cb1e0dbfe172
     or http://127.0.0.1:8890/lab?token=39d31967164428e397358c100fe85b319df6cb1e0dbfe172
```
Make note of the #### (e.g. 8890) in the last two lines of the output.

## 3. Connect from local computer

On local computer, create ssh tunneling.

From output: 
`http://localhost:8890/lab?token=39d31967164428e397358c100fe85b319df6cb1e0dbfe172` (Port is 8890)

On local terminal:
`ssh -NfL 8890:localhost:8890 f005d5b@polaris.dartmouth.edu`

## 4. Open browser

Open URL link in browser.
It may take some time to load, please wait for ~5 minutes or so.

For more details: https://services.dartmouth.edu/TDClient/1806/Portal/KB/ArticleDet?ID=124517


### This tutorial is for setting up [jupyterlab](https://jupyterlab.readthedocs.io/en/stable/) on discovery (Dartmouth's HPC cluster).

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
