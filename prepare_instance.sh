#!/bin/bash
echo "PREPARE INSTANCE LAUNCH BY US"
echo $1
echo $2
echo $3
echo $4

PyRAT=/home/ubuntu/toolkit

CATEGORY=$2
#if [[$CATEGORY="vit" || $CATEGORY = "carvana_unet_2022" || $CATEGORY = "cctsdb_yolo" || $CATEGORY = "ml4acopf"]]
#then
#  echo -1
#else
ONNX_FILE=$3
VNNLIB_FILE=$4
source "${HOME}/conda/etc/profile.d/conda.sh"
source "${HOME}/conda/etc/profile.d/mamba.sh"
conda activate
source ~/.bashrc
mamba activate temp_pyrat

python $PyRAT/pyrat.pyc --read "parsing_only" --model_path $ONNX_FILE --property_path $VNNLIB_FILE \
--config $PyRAT/vnn_config/$CATEGORY.ini
#fi