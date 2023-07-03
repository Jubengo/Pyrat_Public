#!/bin/bash
wget -O Mambaforge.sh  "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge.sh -b -p "${HOME}/conda"
#source "${HOME}/conda/etc/profile.d/conda.sh"
#source "${HOME}/conda/etc/profile.d/mamba.sh"
#conda activate
#source ~/.bashrc
#mamba env create -f pyrat_env.yml -n temp_pyrat -vv
#mamba activate temp_pyrat
#mamba info
#python --version
#python3 --version
#ls
#python pyrat.pyc -h
#python3 pyrat.pyc -h

python -V  # Print out python version for debugging
pip install --upgrade pip
export PIP_DEFAULT_TIMEOUT=300
pip install virtualenv
virtualenv venv
source venv/bin/activate
pip install -r requirements.txt
python --version
python pyrat.pyc -h





export PYTHONPATH=$PYTHONPATH:$PWD