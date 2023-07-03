#!/bin/bash
echo "PREPARE INSTANCE LAUNCH BY US"
echo $1
echo $2
echo $3
echo $4

#CATEGORY=$2
#ONNX_FILE=$3
#VNNLIB_FILE=$4
ls
pwd
conda activate temp_pyrat
python3 pyrat.pyc --read "parsing_only" --model_path $ONNX_FILE --property_path $VNNLIB_FILE --timeout $TIMEOUT \
--config $CATEGORY.ini --log_dir vnncomp --log_name temp
