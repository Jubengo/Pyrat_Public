This directory contains utility functions and examples to run benchmarks to evaluate PyRAT performance

## Benchmarking ACAS:

For example run bench_acas as:

```python

from src.utils.utils_benchmark import bench_acas

bench_acas(prop=3, domains=[["poly"]])
```

Arguments:

- prop: number of the property.
- only_net: tuple (k,l) to specify a unique network to run on. Use for properties > 4 as mentioned
  in https://arxiv.org/abs/1702.01135
- domains: list of additionalDomains to compare. using ```domains = [["zonotopes"], ["poly"]]```
  will compare the results for the zonotopes domains and deeppoly domains, using ```[["poly", "zonotopes"]]``` will
  use the product of the zonotope and deeppoly domains.
- log: file to save the results in as a csv. Use log=False if you don't want to save anything.
- append: Set to True in case you want to append the results to a previous existing log file.
- timeout / split / noiseThreshold / layerPerLayer: parameters to be used for each analysis (see analyze_net function)

Run examples/bench_all_acas.py to benchmark all properties and all relevant networks with zonotopes and poly domains.

### Certifying images

The pipeline is:

1) load the original network (keras, torch, onnx supported soon)
2) load the PyRAT model (using the parsers or exportNet for pytorch models)
3) run analyze_adv with the model, the pyrat_model, the image, its true label, the size of the perturbation, the total
   number of labels and other parameters for analysis (by_layer, nb_process, etc)

You can also use a special loader to test on many images for example in a local folder, see the
utils_dataset.py. The local folder should be arranged with images in one folder per class:
Dataset/class_0/images0.png

See examples/bench_mnist.py for mnist certification and benchLocal for tests from a local folder (change datasetPath if
needed)
