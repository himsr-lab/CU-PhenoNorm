This repo is the home of CU-PhenoNorm, a platform-independent framework for preprocessing of multiplex tissue imaging data. In this repo also all the data and code required to implement the pipeline is included. 

The CU-PhenoNorm pipeline is described in this preprint [bioRxiv DOI: 10.1101/2021.05.10.443525.](https://www.biorxiv.org/content/10.1101/2022.10.20.510630v1)

## More info

Multiplex imaging is a powerful tool to analyze the structural and functional states of cells in their morphological and pathological contexts. Every multiplex imaging technique exhibits platform-specific characteristics in terms of signal-to-noise ratio and acquisition artifacts that need to be accounted for to yield reliable and reproducible results. We propose a pixel classifier-based image preprocessing step that aims to minimize platform-dependency for all multiplex image analysis pipelines. Signal detection and noise reduction as well as artifact removal can be posed as a pixel classification problem in which all pixels in  multiplex images can be assigned to two general classes of either I) signal of interest or II) artifacts and noise. The resulting feature representation maps contain pixel-scale representations of the input data, but exhibit significantly increased signal-to-noise ratios with normalized pixel values as output data. 
<img src="https://github.com/himsr-lab/CU-PhenoNorm/raw/main/Ovarian%20Cancer%20Data/artifactRemoval.png" alt="Example Image">

## Installation

Installing the software and packages required to run this pipeline is straitforward. Fiji can be downloade from: https://imagej.net/software/fiji/downloads and Trainable WEKA Segmentation (TWS) can be added as a plugin https://imagej.net/downloads. 

## Overview of Repository

Here, we list the files we have included as part of this repository.

`Breast Cancer Data/` The processed data regarding the single cell information we extracted from the FR maps of breast cancer datasets is included in this directory. We note that breast cancer dataset is publicly available and can be find here: https://pubmed.ncbi.nlm.nih.gov/30193111/

`Ovarian Cancer Data`- All the raw and processed data regarding the ovarian cancer dataset is included in this directory.
  * `Raw Imaging Data` - This directory includes the raw images from the ovarian cancer dataset.
  * `Single Cell Segmentation maps` - This directory includes the single cell segmentation maps used to quantify the measure the expression level per cell. 
  * `FR maps` - This directory includes the feature representation maps that are which are a representation of the raw images but free from noise and artifacts.
  * `Phenotyping maps` - This directory includes visualization of all the images in the ovarian cancer dataset where the identified cell types by our framework are overlaid back to the images.

`scr/` - All the scripts that can be used to organize the images and prepare data in the format that can be fed into the pipeline for the pixel classification are included in this folder.
  * `LabelSlicesofImages` - To start organizing the data in the format that is required for this pipeline the first step is to inclcude the label/title of each channel in the correspong page in a multipage tiff. This scripts reads the metadata of the images and labels each slice/page of the image with the corresponding channel.
  * `Generate_single_channel_input` - this script read the labeled images generated in the previous step and writes extract the multipage image into a folder with single channel images.
  * `GenerateTrainingStacks` - this script reads from the single_chnnel_input directory and generates training stacks for the pupose of pixel classification.
  

`main` - the scripts for implementation of the main pipeline are included here.
 
 `01-ProbMapGenerator` - Once models are trained for a channel/marker, this script applies those models to the rest of the data for that specific channel and saves the output of the clasifier in the format of FR maps.
 
 `02-MeasureLabeledProbMaps` - This script reads from the generated FR maps and populate single-cell information  with the expression level per marker per cell.
 
 `03-GenerateConvertableCSVtoFCS.py` - The output of the previous step is the input of this script. The output of this script is a cell_table where the rows are cells and columns are expression level of each marker. This output is the input of the unsupervised clustering.



