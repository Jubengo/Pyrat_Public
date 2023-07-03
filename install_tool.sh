#!/bin/bash
wget micro.mamba.pm/install.sh
yes | bash install.sh
echo $MAMBA_ROOT_PREFIX
echo $MAMBA_EXE
#source "${HOME}/conda/etc/profile.d/conda.sh"
#source "${HOME}/conda/etc/profile.d/mamba.sh"
source ${HOME}/.bashrc
exec bash
micromamba activate
micromamba create -f pyrat_env.yml -y
micromamba activate temp_pyrat
python --version
python pyrat.pyc -h
export PYTHONPATH=$PYTHONPATH:$PWD