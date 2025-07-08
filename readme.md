# PyRAT (Python Reachability Assessment Tool)

<p align="center">
<a href="https://pyrat-analyzer.com/"><img src="docs/img/logo_small.png" width="50%"></a>
</p>

PyRAT is a tool to evaluate the safety of a neural network through abstract interpretation techniques. It ranked
second at the [VNN-COMP 2024](https://arxiv.org/abs/2410.23903) by participating in all 12 benchmarks of the regular
track and proving more than 1700
properties.

<p align="center">
<img src="docs/abstract.png" width="80%">
</p>

## Install

We recommend that you create a new virtual environment for installing PyRAT with **Python 3.10**.

Requirements are tested with Python 3.10. Newer versions of some packages might need some troubleshooting. Only
packages known to cause issues are fixed in the requirements.
### pip
install with pip using:
```commandline
pip install . 
```

### Conda / mamba
Otherwise, we suggest to use conda or [mamba](https://github.com/mamba-org/mamba) to create a new environment with all
required packages and activate it by using the provided `pyrat_env.yml` file.

```commandline
conda env create -f pyrat_env.yml
```

or

```commandline
mamba env create -f pyrat_env.yml
```

### Manually

You can also just install manually the required packages in the `requirements.txt` file.

### Docker version

You can try the Dockerfile to run PyRAT in a container.

In a terminal on the root of PyRAT folder you can build the image with:

```bash
docker build . -t pyrat_image
```

Run the image interactively:

```bash
docker run -it pyrat_image bash
```

### Building the documentation

PyRAT documentation can be found in the `docs` folder. It can also be built using MkDocs. First install the
corresponding requirements:
```bash
pip install .[docs]
```

Then you can serve the documentation locally with:

```bash
mkdocs serve
```

## Run PyRAT

If PyRAT is installed with `pip install .` it is possible to use `pyrat` directly as a command. Otherwise, the main 
PyRAT script file can be found in `pyrat/main.py`.

To list all available option use

```commandline
pyrat -h
```

Analyses can be also run with a `config.ini` file to list and reuse more easily the different configurations. Some
examples can be found in [this folder](benchmarks/vnn_files/).

If a config file is supplied with command line argument the CLI argument will overload the config argument. Order of
importance is :

```
CLI explicit arguments > config.ini arguments (optional) > default values.
```

For a complete usage guideline see [Usage](docs/usage.md).

### Small examples

```bash
pyrat --dataset mnist --model_path ./data/models/mnist/smallFNN.onnx --nb_img 100 --epsilon 0.05 --split False

pyrat --split True --acas 3 1 3 --verbose True --domains zonotopes

pyrat --model_path ./data/models/technip/test_offi.nnet --property_path ./data/properties/technip/prop3.txt --split True --verbose True --nb_process 4 --domains zonotopes --timeout 60
```

### Runnning the test

To run all tests using pytests, one can use:

```bash
python -m pytest -s tests
```