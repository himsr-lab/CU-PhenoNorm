# A Platform-Independent Framework for Preprocessing of Multiplex Tissue Imaging Data

This repo is under development and is designed to preprocess multiplex imaging data. Here is a step-by-step instruction for using this pixel-level classification-based pipeline:
## Overview of the framework
In this framework all pixels in multiplex images can be assigned to two general classes of either I) signal of interest or II) artifacts and noise. The resulting feature representation maps (FRmap) contain pixel-accurate representations of the input data, but exhibit significantly increased signal-to-noise ratios with normalized pixel values as output data. The input of the pipeline is a multipage image of a marker and the output is the corresponding FRmaps. To use this pipeline the multiplex images should be extracted into single channel for each FOV. That is:<br />
fov1 <br />
|---------CD3.tiff <br />
|---------CD4.tiff <br />
|---------CD8.tiff <br />
|---------CD45.tiff <br />
.<br />
.<br />
.<br />

fov2<br />
|---------CD3.tiff <br />
|---------CD4.tiff <br />
|---------CD8.tiff <br />
|---------CD45.tiff <br />
.<br />
.<br />
.<br />
fov3<br />
.<br />
.<br />
.<br />



## Installation
### Requirements for specific operating systems
#### Windows
#### macOS
## Directory and data structure

