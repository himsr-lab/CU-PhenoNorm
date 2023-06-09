# A Platform-Independent Framework for Phenotyping of Multiplex Tissue Imaging Data
Multiplex imaging is a powerful tool to analyze the structural and functional states of cells in their morphological and pathological contexts. Every multiplex imaging technique exhibits platform-specific characteristics in terms of signal-to-noise ratio and acquisition artifacts that need to be accounted for to yield reliable and reproducible results. We propose a pixel classifier-based image preprocessing step that aims to minimize platform-dependency for all multiplex image analysis pipelines. Signal detection and noise reduction as well as artifact removal can be posed as a pixel classification problem in which all pixels in  multiplex images can be assigned to two general classes of either I) signal of interest or II) artifacts and noise. The resulting feature representation maps contain pixel-scale representations of the input data, but exhibit significantly increased signal-to-noise ratios with normalized pixel values as output data. 
<img src="https://github.com/himsr-lab/CU-PhenoNorm/raw/main/data/artifactRemoval.png" alt="Example Image">

