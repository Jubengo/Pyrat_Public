#!/bin/bash
mamba install numpy onnx~=1.8.1 pyparsing~=2.4.7 psutil tqdm~=4.59.0 onnxruntime>=1.7.0 \
keras~=2.6.0 matplotlib~=3.3.4 networkx~=2.5.1 pytest~=6.2.4 pyvis~=0.1.9 gitpython~=3.1.18 \
pandas~=1.2.4  loguru~=0.5.3 pillow~=8.4.0 tensorflow configargparse -c conda-forge
mamba install pytorch torchvision cpuonly -c pytorch
pip install opencv-python~=4.5.1.48 scipy~=1.5.4