#!/bin/bash
#SBATCH --job-name=jupyter_notebook
#SBATCH --time=1-00:00:00
#SBATCH --mem=10G
#SBATCH --output=jupyter_notebook.txt
#SBATCH --error=jupyter_notebook.err
# get tunneling info
XDG_RUNTIME_DIR=""
node=$(hostname -s)
user=$(whoami)
cluster="discovery"
jupyter lab --no-browser --ip=${node}
# keep it alive
sleep 36000
