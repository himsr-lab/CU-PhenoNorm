## Overview of Repository

This repository contains all the figures used in the manuscript and supplementary text, along with the corresponding numerical values required to generate these figures. Below is a detailed explanation of the location of the data for each figure:

- `Figure1`: This diagram represents the pipeline and does not contain any numerical values.

- `Figure2/`: This figure consists of 4 subplots that involve numerical values:

    - Fig.2a: This subplot utilizes the images `Hepatocyte.tif`, `CD20_raw.tif`, and `CD20_FRmap.tif`. The data for the two histograms in this subplot can be found in `Histogram of CD20_inset_FRmap.csv` and `Histogram of CD20_inset_raw.csv`.

    - Fig.2b: This subplot utilizes the images `Ki67_raw.tif` and `Ki67_FRmap.tif`. The data for the two histograms in this subplot is available in `Histogram of Ki67_inset_FRmap.csv` and `Histogram of Ki67_inset_raw.csv`.

    - Fig.2c: This subplot utilizes the images `Pan-Keratin_raw.tif` and `Pan-Keratin_FRmap.tif`. The data for the two histograms in this subplot can be found in `Histogram of Pan-Keratin_inset_FRmap.csv` and `Histogram of Pan-Keratin_inset_raw.csv`.

    - Fig.2d: This subplot utilizes the images `CD163_raw.tif` and `CD164_FRmap.tif`. The data for the two histograms in this subplot can be found in `histogramcell_A_raw.csv`, `histogramcell_B_raw.csv`, `histogramcell_C_raw.csv`, `histogramcell_A_FRmap.csv`, `histogramcell_B_FRmap.csv`, and `histogramcell_C_FRmap.csv`. Additionally, the cell boundaries are provided in `RoiSet.zip`, and the signal measurements on both the raw image and the FRmap are given in `aggregate_Cell_A_B_C_measurements.csv`.

- `Figure3_S1_S2/`: This directory includes the data required to reproduce the figures 3, S1, and S2.
    - Fig.3a and S1a:  The data for the tSNE and corelation plots in this figure are given  `cell_table_breast_cancer.csv.zip`.

    - Fig.3b: The data for required to reproduce the heatmaps are given  `cell_table_breast_cancer.csv.zip`.

    - Fig.3c:  The data for required to reproduce the correlation plot and the Pearson correlation coefficients are given in `summary_table_TNBC` and 'summary_table_us.csv`.
