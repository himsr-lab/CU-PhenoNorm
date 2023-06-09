// 2021-03-16



input_dir = getDir(" ");
output_dir = getDir(" ");
filelist = getFileList(input_dir);

for (ff = 0; ff < lengthOf(filelist); ff++) {
    if (endsWith(filelist[ff], ".tiff")) {
    	
    
run("Bio-Formats Macro Extensions");  // start extension

    	
metadataPrefixes = newArray("Name #", "PageName #");
metadataCounting = newArray("0", "01", "1");
countingLength = metadataCounting.length;
prefixesLength = metadataPrefixes.length;
offset = 0;  // offset between key and slide numbering
prefix = "";  // metadata key prefix preceeding count
slice = 0;  // default "not found" return value from Ext.getMetadataValue()

file = input_dir + filelist[ff];//File.openDialog("Select a TIFF file to open...");
//print(file);
run("Bio-Formats Importer", "open=[file]");
Ext.setId(file);  // make file accessible to extension
Ext.getImageCount(sliceCount);  // nSlices()

  for (i = 0; slice == 0 && i < prefixesLength; ++i)  // try different metadata prefixes
  {

    for (j = 0; slice == 0 && j < countingLength; ++j)  // try different metadata counts
    {
      Ext.getMetadataValue(metadataPrefixes[i] + metadataCounting[j], slice);
      if ( slice != 0 )  // matching prefix/count pair
      {
        prefix = metadataPrefixes[i];
        counting = metadataCounting[j];
        if ( counting == "0" )
          offset = -1;
      }
    }

  }

  for (k = 1; k <= sliceCount; ++k)  // extract metadata for each slice
  {
    setSlice(k);
    if ( counting == "01" && k <= 9 )  // Polaris
      Ext.getMetadataValue(prefix + "0" + k, slice);
    else  // MIBI, Vectra
      Ext.getMetadataValue(prefix + (k + offset), slice);
    if ( slice == 0 )
      slice = k;
    setMetadata("Label", slice);  // add label to slice
    slices = Array.concat(slices, slice);
    print("\t" + k + ".) " + slice);
  }
title_image = getTitle();
saveAs("Tiff", output_dir+title_image);
run("Close All");
}

}
  //run("Bio-Formats Importer","save=[" + tifFile + "] export compression=LZW");  // window pane




