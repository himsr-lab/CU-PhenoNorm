input_dir = getDirectory("");// Input directory : path to folders where the images are saved inside each folder.
output_dir = getDirectory(" "); // where to save the output data
single_channel_input = getDirectory(" ");//path to one of the directories where channels are saved.


marker_list = getFileList(single_channel_input); //list of markers for each we want to generate training stacks

Array.print(marker_list); 
//run("Bio-Formats Macro Extensions"); 

for (j = 0; j < lengthOf(marker_list); j++) {
    if (endsWith(marker_list[j], ".tif")) { 
    	run("Bio-Formats Macro Extensions"); 

		marker_name = marker_list[j];
		print(marker_name);    
		dir_list = getFileList(input_dir);
		//Array.print(dir_list);
		for (i = 0; i < lengthOf(dir_list); i++) {
			folder_name = dir_list[i];
			
			file=input_dir+folder_name+marker_name;
    		run("Bio-Formats Importer", "open=[file]");
			
			selectWindow(marker_name);
			rename(folder_name);
			}
		run("Images to Stack", "name="+marker_name+" title=[] use");
		saveAs("tiff", output_dir + marker_name);
		
		run("Close All");
    } 
}



