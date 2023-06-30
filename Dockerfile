# Dockerfile for pyrat
#
# To build image:
# docker build . -t pyrat_image
#
# To get a shell after building the image:
# docker run -it pyrat_image bash

FROM python:3.9

COPY ./requirements.txt /work/requirements.txt

# set working directory
WORKDIR /work

# install python package dependencies
RUN apt update
RUN apt install apt-utils
RUN apt-get update  && apt-get install -y wget && apt-get clean && rm -rf /var/lib/apt/lists/

RUN apt-get update
RUN apt-get install cmake -y
RUN apt-get install protobuf-compiler -y
RUN apt install -y libopenblas-dev zip -y
RUN pip --default-timeout=1000 install -r requirements.txt

# copy remaining files to docker
COPY . /work
RUN cd /work && ls


# Experimental: using conda
#ENV CONDA_DIR /opt/conda
#RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && /bin/bash ~/miniconda.sh -b -p /opt/conda
#
## Put conda in path so we can use conda activate
#ENV PATH=$CONDA_DIR/bin:$PATH
#RUN conda install mamba -c conda-forge -y
# RUN cd /work && mamba env create -f pyrat_env.yml
# RUN conda info --envs


# set environment variables
ENV PYTHONPATH=$PYTHONPATH:/work



# cmd, run one of each benchmark
#CMD cd /work && python -m pytest -s tests

