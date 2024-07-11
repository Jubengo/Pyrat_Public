#!/bin/bash
wget -O Mambaforge.sh  "https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh"
bash Mambaforge.sh -b -p "${HOME}/conda"
source "${HOME}/conda/etc/profile.d/conda.sh"
source "${HOME}/conda/etc/profile.d/mamba.sh"
conda activate
source ~/.bashrc
mamba env create -f pyrat_env.yml -n temp_pyrat
mamba activate temp_pyrat
python --version
python pyrat.pyc -h
export PYTHONPATH=$PYTHONPATH:$PWD
python -c "import torch; print(torch.cuda.is_available())"
conda install pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
python -c "import torch; print(torch.cuda.is_available())"