This tutorial is for setting up [jupyterlab](https://jupyterlab.readthedocs.io/en/stable/) on discovery (Dartmouth's HPC cluster).

## 1. Install conda

`wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh`

## 2. Install jupyterlab

`conda install -c conda-forge jupyterlab`

## 3. Start jupyterlab

`jupyter lab --no-browser`

## 4. Connect from local computer

`ssh -NfL 8888:localhost:8888 f0052zm@discovery.dartmouth.edu`

## 5. Open browser

copy paste the url from step 3 output

## Tips 

the `screen` command is useful. You can start a a new screen, then start jupyterlab and let it run, then detach from the screen. Then jupyter lab will be running the background.

https://services.dartmouth.edu/TDClient/1806/Portal/KB/ArticleDet?ID=72109