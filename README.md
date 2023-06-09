# CU-PhenoNorm

CU-PhenoNorm is a platform-independent framework for preprocessing multiplex tissue imaging data. This repository includes all the necessary data and code required to implement the pipeline.

The CU-PhenoNorm pipeline is described in the preprint article [bioRxiv DOI: 10.1101/2021.05.10.443525](https://www.biorxiv.org/content/10.1101/2022.10.20.510630v1).

## More Info

Multiplex imaging is a powerful tool for analyzing the structural and functional states of cells within their morphological and pathological contexts. However, each multiplex imaging technique has platform-specific characteristics such as signal-to-noise ratio and acquisition artifacts that need to be accounted for to obtain reliable and reproducible results. To address this, we propose a pixel classifier-based image preprocessing step that minimizes platform-dependency in multiplex image analysis pipelines. This step involves signal detection, noise reduction, and artifact removal by assigning pixels to classes of signal of interest or artifacts and noise. The resulting feature representation maps provide pixel-scale representations with normalized pixel values and significantly increased signal-to-noise ratios.

![Example Image](https://github.com/himsr-lab/CU-PhenoNorm/raw/main/Ovarian%20Cancer%20Data/artifactRemoval.png)

## Installation

To run this pipeline, you need to install Fiji and Trainable WEKA Segmentation (TWS). Fiji can be downloaded from [https://imagej.net/software/fiji/downloads](https://imagej.net/software/fiji/downloads), and TWS can be added as a plugin from [https://imagej.net/downloads](https://imagej.net/downloads).

## Overview of Repository

This repository contains the following files and directories:

- `Breast Cancer Data/`: This directory includes processed data related to the single-cell information extracted from the FR maps of breast cancer datasets. The breast cancer dataset is publicly available and can be found at [https://pubmed.ncbi.nlm.nih.gov/30193111/](https://pubmed.ncbi.nlm.nih.gov/30193111/).

- `Ovarian Cancer Data/`: This directory contains all the raw and processed data related to the ovarian cancer dataset.
  - `Raw Imaging Data/`: Raw images from the ovarian cancer dataset.
  - `Single Cell Segmentation maps/`: Single cell segmentation maps used for quantifying the expression level per cell.
  - `FR maps/`: Feature representation maps that are representations of the raw images but free from noise and artifacts.
  - `Phenotyping maps/`: Visualization of all the images in the ovarian cancer dataset with the identified cell types overlaid.

- `scr/`: This folder includes scripts used to organize the images and prepare the data in the required format for the pixel classification.
  - `LabelSlicesofImages`: Organizes the data by including the label/title of each channel in the corresponding page of a multipage TIFF.
  - `Generate_single_channel_input`: Extracts the labeled images generated in the previous step into a folder with single-channel images.
  - `GenerateTrainingStacks`: Generates training stacks for pixel classification by reading from the single_channel_input directory.

- `main/`: Scripts for implementing the main pipeline.
  - `01-ProbMapGenerator`: Applies trained models for a channel/marker to the rest of the data for that channel and saves the output of the classifier in the format of FR maps.
  - `02-MeasureLabeledProbMaps`: Reads the generated FR maps and populates single-cell information with the expression level per marker per cell.
  - `03-GenerateConvertableCSVtoFCS.py`: Takes the output from the previous step and generates a cell_table where the rows represent cells and the columns represent the expression level of each marker. This output serves as the input for unsupervised clustering.

Please refer to the respective directories and scripts for more detailed information on their usage.










!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
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

Additional Information
Support
For support, please contact Nat Hawkins at hawki235@msu.edu.

Inquiry
All general inquiries should be directed to Arjun Krishnan at arjun@msu.edu.

License
This repository and all its contents are released under the Creative Commons License: Attribution-NonCommercial-ShareAlike 4.0 International; See LICENSE.md.

Citation
If you use this work, please cite:
Systematic tissue annotations of genomic samples by modeling unstructured metadata
Nathaniel T. Hawkins, Marc Maldaver, Anna Yannakopoulos, Lindsay A. Guare, Arjun Krishnan
bioRxiv 2021.05.10.443525; doi: https://doi.org/10.1101/2021.05.10.443525

Funding
This work was primarily supported by US National Institutes of Health (NIH) grants R35 GM128765 to AK and in part by MSU start-up funds to AK and MSU Rasmussen Doctoral Recruitment Award and Engineering Distinguished Fellowship to NTH.

Acknowledgements
The authors would like to thank Kayla Johnson for their support and feedback on the manuscript, and all members of the Krishnan Lab for valuable discussions and feedback on the project.

References
[1] Ontology-aware classification of tissue and cell-type signals in gene expression profiles across platforms and technologies. Lee Y, Krishnan A, Zhu Q, Troyanskaya OG. Bioinformatics (2013) 29:3036-3044.

