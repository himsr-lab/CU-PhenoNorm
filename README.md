This repo is the home of CU-PhenoNorm, a platform-independent framework for preprocessing of multiplex tissue imaging data. In this repo also all the data and code required to implement the pipeline is included. 

The CU-PhenoNorm pipeline is described in this preprint [bioRxiv DOI: 10.1101/2021.05.10.443525.](https://www.biorxiv.org/content/10.1101/2022.10.20.510630v1)

# More info

Multiplex imaging is a powerful tool to analyze the structural and functional states of cells in their morphological and pathological contexts. Every multiplex imaging technique exhibits platform-specific characteristics in terms of signal-to-noise ratio and acquisition artifacts that need to be accounted for to yield reliable and reproducible results. We propose a pixel classifier-based image preprocessing step that aims to minimize platform-dependency for all multiplex image analysis pipelines. Signal detection and noise reduction as well as artifact removal can be posed as a pixel classification problem in which all pixels in  multiplex images can be assigned to two general classes of either I) signal of interest or II) artifacts and noise. The resulting feature representation maps contain pixel-scale representations of the input data, but exhibit significantly increased signal-to-noise ratios with normalized pixel values as output data. 
<img src="https://github.com/himsr-lab/CU-PhenoNorm/raw/main/Ovarian%20Cancer%20Data/artifactRemoval.png" alt="Example Image">

# Installation

Installing the software and packages required to run this pipeline is straitforward. Fiji can be downloade from: https://imagej.net/software/fiji/downloads and Trainable WEKA Segmentation (TWS) can be added as a plugin https://imagej.net/downloads. 

# Overview of Repository

Here, we list the files we have included as part of this repository.

data/ Ovarian Cancer Data- All the raw and processed imaging data, single-cell segmentation maps, single_cell tabular data are included in this folder.
scr/- All the scripts that can be used to organize the images and prepare training stacks for the pixel classification are included in this folder.
main- the scripts for implementation of the main pipeline are included here.


