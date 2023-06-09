 // Path to the directory where the training stacks are stored.
training_stack_dir = getDir("Path to the directory where the training stacks are stored");

//Path to the directory where the feature representation maps are stored. 
FRmap_dir = getDir("Path to the directory where the feature representation maps are stored");

// Path to the directory where single channel tiifs are stored.
single_channel_input_dir =  getDir("Path to the directory where single channel tiifs are stored."); 

// Gererate a list from the markers in training stack folder.
marker_list = getFileList(training_stack_dir);
// Generate a list from the folders where single channel data are stored.
folder_list = getFileList(single_channel_input_dir); 

// Generate a list from the markers for which FRmaps are generated.
FRmap_list = getFileList(FRmap_dir); 

//////////////////////////////////////////////////////////////////////////////////////////////
///////////Comment this section if the class 2 is already removed from the FRmaps ////////////
run("Close All");
// Remove the class 2 slices from the FRmap stack
for (t = 0; t <lengthOf(FRmap_list) ; t++) {
    if (endsWith(FRmap_list[t], ".tif")) {
        file = FRmap_dir + File.separator + FRmap_list[t];
        open(file);
        FRmap_name = getTitle();
        run("Stack Splitter", "number="+nSlices);
		run("Images to Stack", "name=Stack title=[class 1]");
		//Save the current image in the right directory
        saveAs("tiff", FRmap_dir+File.separator+FRmap_name);
    }
    }
run("Close All");
//////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
// Loop over all the markers from which a stack is generated. 
for (j = 0; j <lengthOf(marker_list) ; j++) {
    if (endsWith(marker_list[j], ".tif")) {
        file = training_stack_dir + File.separator + marker_list[j];
        run("Bio-Formats Macro Extensions", "open=file");
        run("Bio-Formats Windowless Importer", "open=file");
        // make file accessible to extension
        Ext.setId(file);  
        // from extension get the nSlices
        Ext.getImageCount(sliceCount); 
        // Get the title of current marker 
        marker_name = getTitle();
        // Initialize an array that stores the title of images in training stacks in order
        fov_name_in_order = newArray(sliceCount);
        // Fill the initialized array by extracting the metadata at eacch iteration.
        for (k = 1; k <= sliceCount; k++){  
	        setSlice(k);
	        Property.setSliceLabel(folder_list[k-1], k);
	        fov_name_in_order[k-1] = getInfo("slice.label");
        }
        run("Close All");
        // Generate the path to the FRmap corresponding to the current marker name
        FRmap_name = substring(marker_name, 0, indexOf(marker_name, " ("))+"_FRmap.tif";
        path_to_FRmap = FRmap_dir+File.separator+FRmap_name;
        open(path_to_FRmap);
        FRmap_name = getTitle();
  		// Name each slice of the FRmaps with the fov they are extracted from.
        for( slice=1; slice<=sliceCount; slice++){
       		setSlice(slice);
			setMetadata("Label", ""+fov_name_in_order[slice-1]);
        }
        // Save the FRmap stack that is now labeled-each slice is labeled with the fov it is extracted from 
        saveAs("tiff", FRmap_dir+File.separator+FRmap_name); 
          
        // Split the FRmap stack, keep the class 1 slices, make a stack, name slices on stack	
       run("Stack Splitter", "number="+sliceCount);
       close(FRmap_name);
       for (i = 1; i <= sliceCount; i++) {
          selectWindow(fov_name_in_order[i-1]);
          fov_id = getTitle();
          // Path to directory where the current image should be stored.
          path_to_single_channel_input = single_channel_input_dir+File.separator+fov_id; 
		  //Save the current image in the right directory
          saveAs("tiff", path_to_single_channel_input+FRmap_name);
          close();
       }
     //selectWindow("name");
     Ext.close();
    run("Close All");    
    }
    }