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

- `Breast Cancer Data/`: This directory includes processed data related to the single-cell information extracted from the FR maps of breast cancer datasets. The breast cancer dataset is studied in https://pubmed.ncbi.nlm.nih.gov/30193111/ and publicly available at can be found at https://mibi-share.ionpath.com
  -`Training Data`: This directory includes all the labeled data and classifier models trained for the definitive markers for the breast cancer dataset.

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

## Additional Information

### Support
For support, please contact Mansooreh Ahmadian at mansooreh.ahmadian@cuanschutz.edu.

### Inquiry
For general inquiries, please contact Kimberly R Jordan at kimberly.jordan@cuanschutz.edu.

### Citation
If you use this work, please cite the following article:
"A Platform-Independent Framework for Phenotyping of Multiplex Tissue Imaging Data"  
Mansooreh Ahmadian, Christian Rickert, Angela Minic, Julia Wrobel, Benjamin G Bitler, Fuyong Xing, Michael Angelo, Elena W.Y Hsieh, Debashis Ghosh, Kimberly R Jordan  
[bioRxiv DOI: 10.1101/2021.05.10.443525](https://www.biorxiv.org/content/10.1101/2022.10.20.510630v1).

### Funding
This work was partially supported by the Human Immune Monitoring Shared Resource (RRID:SCR021985) within the University of Colorado Human Immunology and Immunotherapy Initiative and the University of Colorado Cancer Center (P30CA046934). BGB is supported by the DOD for TMA construction (Award OC170228) and the Kay L. Dunton Endowed Memorial Professorship In Ovarian Cancer Research. MA is supported by NIH/NCATS Colorado CTSA Grant Number UL1 TR002535.

### Acknowledgements
The authors would like to thank Dr. Leeat Keren for kindly sharing the raw imaging data from the triple-negative breast cancer study.
