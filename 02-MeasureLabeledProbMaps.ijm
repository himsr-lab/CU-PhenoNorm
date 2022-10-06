
print("\\Clear");
// which directory contains the tifs, ROIs, and where to put the results?
input_path = "/Users/ahmadiam/Desktop/TestPhenoCode/Prob/";//multi-channel unlabeled probability maps
prob_path = "/Users/ahmadiam/Desktop/TestPhenoCode/Labeled/";//single-channel labeled probability maps
roi_path = "/Users/ahmadiam/Desktop/TestPhenoCode/ROI/";//RIO  
output_path = "/Users/ahmadiam/Desktop/TestPhenoCode/CSVs/";//results in CSV format 


filelist = getFileList(input_path) 
//Array.print(filelist);
slice_name = newArray("beta-tubulin (113)","CD11b (155)","CD11c (144)","CD163 (142)","CD20 (167)","CD3 (159)","CD31 (152)","CD4 (143)","CD45 (175)","CD45RO (161)","CD56 (151)","CD68 (156)","CD8 (158)","DC-SIGN (173)","dsDNA (89)","Granzyme B (150)","HLA class 1 A, B, and C, Na-K-ATPase alpha1 (176)","HLA DR (172)","IDO-1 (171)","Keratin (165)","Ki-67 (153)","LAG3 (147)","PD-1 (148)","PD-L1 (149)","Podoplanin (170)","Vimentin (163)");
for (i = 0; i < lengthOf(filelist); i++) {
    if (endsWith(filelist[i], ".tif")) { 
        open(input_path + File.separator + filelist[i]);
        title = getTitle();
	    print(title);
        selectWindow(title);
        run("Split Channels");
        selectWindow("C1-" + title);
        
        for (k = 1; k <= 26; ++k){  // extract metadata for each slice
	        setSlice(k);
	        Property.setSliceLabel(slice_name[k-1], k)
        saveAs("tiff", prob_path + title );
        }
    run("Close All");
    }
}

fileList = getFileList(prob_path); 
roiList = getFileList(roi_path);
for (f=0; f<fileList.length; f++){ //loops over all images in the given directory
	
	//clean-up to prepare for analysis
	roiManager("reset");	
	run("Close All");
	run("Clear Results");

	//open file
	open(prob_path + fileList[f]);
	title = getTitle();
	run("ROI Manager...");
    roiManager("Open", roi_path + fileList[f]+".zip");
	selectWindow(fileList[f]);
	roiManager("multi-measure measure_all append");
	
	// Save results with specific name
	updateResults();
	saveAs("results", output_path + title + "_results.csv");
	run("Close All");
	
}


