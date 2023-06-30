- **Backsubstitution on non-sequential networks**
  - Clean Poly init and create `create_poly` function
  - Replace the numpy arrays for the coefs in Poly by a NoiseBoxGroup to be able to leverage the same functions
  - Modify the backsub function to work on graph networks

- **02/06/2023: Alpha-PyRAT**
  - Adds a parameter alpha for the ReLU lower slope in the poly domain
  - The alphas can be optimised upon to obtain more precision in the approximation

- **02/02/2023: Folder structure and documentation** 1d9c1c563b1b292cba8afa80401e4f7602f341a6
  - Reorganise folder structure of PyRAT with `src` and `data` folder
  - Add Sphinx doc generation through Gitlab CI and Pages. Available
    here: https://laiser.frama-c.com/pyrat_sound/index.html
  - Add optional CI job to check docstring style with pydocstyles
  - Add missing tests for counter example and Softmax
  - Add explanation of maxpool layer in the documentation

- **27/01/2023: Improve printing for bench_adv** 0ce2841fb75f0e07aeac8a46a7fa2346c7e7a546
  - Print a table at the end of bench_adv with a summary of results
  - Fix #80 and #81

- **26/01/2023: Transform Maxpool into ReLU** 9a9dd3fe460e0f44e18aca613ea97137cf7ca27b
  - Use similar techniques as DNNV to transform Maxpool layers into a succesion of Convolution / ReLU layers, allowing to use ReLU approximation for Maxpool
  - Improve on DNNV method with new method, faster and more precise
  - Close #55

- **19/01/2023: Add convolution in Torch** 41a59904e22e6d9ffc043ad3cb13a6837e1c7cfe
  - Convolutions with the Torch library now use torch operations directly torch.conv2d is used for Box and NoiseBox use torch.conv3d.
  - Adds parameter conv_type to choose mode of convolution
  - Fix #65 and #71

- **10/01/2023: Cleaning and fix** 9b00311dd15c794928252120ef0a0dd285748807
  - Clean booster related issue #77 and code
  - Fix bug #69

- **03/01/2023: Counter examples** 7a9c5dbf30788ee43a5959cb60777ec90e71fb11
  - Add counter example search functions in single analysis and split analysis
  - Counter example search are either based on Foolbox for adversarial attacks by computing the gradient or with the coefficient of a relational domain as a gradient
  - Search can be done before or after the analysis
  - FGSM, BIM, PGD, Deepfool attacks are implemented

- **28/11/2022: VNNLib Support** 7a9c5dbf30788ee43a5959cb60777ec90e71fb11
  - Adds VNNLib parser using similar basis as our internal parser 
    - Inputs as 2 assert and 1 assert for output are supported
    - Multiple assert on input and output at the same time are supported, multiple analysis are done if needed
  - Introduction of AnalysisParam class to store all parameters of the analysis
  - Analysis function have been centralised and use the AnalysisParam object
  - Auto detect squeeze
  - Remove warning and reformat errors

- **04/08/2022: Improve poly domain** 7f6fc25577ddbf8ec6df38c17a0a29c65552530a
  - Faster backsubstitution for the poly domain
    - Use flattening before doing backsubstitution
    - Only backsubstitute on unstable relus
  - Introduce a new meta Domain to handle all specificities of Poly with by_layer
  - Add sigmoid and tanh approximation to Poly domain
  - Improve sigmoid and tanh for Zonotope domain
  - Rework SingleAnalysisResult
- **20/07/2022:	Local Convolution** 61edc3574015f24f9659074e53416454e80373a8
  - Make convolution more local for noise symbols and coefficients

- **05/07/2022:	Less RAM used for the analysis** 1fd521bd3af84727ec8d24e943a73f8aae60db8b
  - Revamp the \_\_mul\_\_ for the Box to lessen the temp variables
  - Revamp the activations functions for the different domains
  - Fix bug introduced by multi-lib MR that removed some noise symbols
  - Fix bug that added too much merged_noise

- **20/06/2022:** Fix some bugs introduced by previous MR d474bc05f19f7982fdf731c0ece3ff72172a44e5

- **13/06/2022:	Add multi-library support** 8ab899532b4ff26bf80be13767bce7e5ee6868e6
  - Add an abstraction level to Box and add operation classes to allow multiple computing libraries to be used in PyRAT without rewriting all domains. Default library is Numpy
  - Torch is introduced as a library. This includes GPU support.
  - Scorer is simplified into CoefScorer
  - New tests

- **13/06/2022:**	Improve help options
- **20/04/2022:**	Fix error in QuantizeLinear
- **17/02/2022:**	Add symbolic interval domain
  - DeepPoly domain supports a maximum size as well
  - More ONNX support
  - Add Sigmoid and Tanh support for Zonotopes
- **16/12/2021:**	New version of DeepPoly domain, faster.
- **29/11/2021:**	Introduction of NoiseBox and NoiseBoxGroups to better handle the source of the noises and be able to easily modulate the maximum size allowed for arrays of noise.
- **01/10/2021:**	Introduction of booster and scorer in the split analysis.
- **25/08/2021:**	Add ReduceMean, QuantizeLinear, DequantizeLinear support. Add some meta functions on layers to simplify their analysis.
- **06/08/2021:**	Add more complete ONNX Parser. Change internal representation of network to a graph like structure and allow propagation in it.
- **12/07/2021:**	Add analysis log
- **26/05/2021:**	Add progress bar for parallel analysis
- **06/05/2021:**	Add named noises for zonotopes and allow modulation between merged and named
- **26/04/2021:**	Add backsubstitution for Poly layer
- **23/04/2021:**	Property improvements, add new layer to gain precision on output comparison
- **15/04/2021:**	Cosmetic changes
