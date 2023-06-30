#!/bin/bash
wget -O Mambaforge.sh  "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge.sh -b -p "${HOME}/conda"
source "${HOME}/conda/etc/profile.d/conda.sh"
source "${HOME}/conda/etc/profile.d/mamba.sh"
conda activate
source ~/.bashrc
mamba env create -f pyrat_env.yml -n temp_pyrat
mamba activate temp_pyrat
conda env export --no-builds
mamba env export --no-builds
python --version
python3 --version
python310 --version
python pyrat.pyc -h
python3 pyrat.pyc -h
python310 pyrat.pyc -h
export PYTHONPATH=$PYTHONPATH:$PWD