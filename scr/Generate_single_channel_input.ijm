//////////////////////////// USER INPUT //////////////////////
number_of_slides = 34

//////////////////////////////////////////////////////////////



input_dir = getDir(" ");
output_dir_init = getDir(" ");


filelist = getFileList(input_dir);
for (j = 0; j < lengthOf(filelist); j++) {
    if (endsWith(filelist[j], ".tiff")) {
    	
        file = input_dir + filelist[j];
        open(file);
      
        image_name = getTitle();
        image_name_reduced = substring(image_name,0,indexOf(image_name,"."));
        run("Stack Splitter", "number=number_of_slides");
        close(image_name);

        File.makeDirectory(output_dir_init+image_name_reduced);
        File.makeDirectory(output_dir_init+image_name_reduced);
        //File.makeDirectory(output_dir_init+image_name_reduced);
        for (n =1; n<= number_of_slides; n++){
            selectImage(n);
            title = getTitle();
            //short_name = substring(title,0,indexOf(title,"("));
            short_name = title;//substring(title,0,indexOf(title," ("));
            
            saveAs("tiff",output_dir_init+image_name_reduced+"/"+short_name );
            
            }   
            
    run("Close All");	
    }
   
}
