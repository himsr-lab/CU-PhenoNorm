
  
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Jan 22 09:45:23 2021
@author: ahmadiam
Update on Tue 03/23/2021: CR
- Delimiter for cell id / mask changed to colon character
- Added newline parameter to open function call, see:
  https://docs.python.org/3/library/csv.html#csv.writer
- Variable name typo fixed
"""

### This code takes the directory of CSV files from the user,
### change the data format such that each row is a cell_id and
### columns are various measurments (such as mean, median, X, Y)
### for different masks (that is cell mask, cytosol mask, and neucleus mask)


import numpy as np
import csv
from glob import glob
from string import ascii_letters

estimated_number_of_rows = 10000
estimated_number_of_markers = 26
number_of_masks = 3


input_path = "/Users/ahmadiam/OneDrive - The University of Colorado Denver/Bioinformatics paper/Iteration3/MIBI/imjCSV/**/*.csv"

## Generate a list from name of all CSVs in the directory entered by the user
EXT = "*.csv"
# all_csv_files = [file
#                  for path, subdir, files in os.walk(input_path)
#                  for file in glob(os.path.join(input_path, EXT))]
all_csv_files =[]

[all_csv_files.append(file) for file in glob(input_path, recursive=True)]

## walk through the list of csv files, read, clean, and write
## a new csv with the same name in the working directory
for each_csv in all_csv_files:

    list_of_column_labels = ["cell_id"]
    with open(each_csv) as file:
        max_cell_id = 0
        csv_file_name = each_csv.split('/')[-1]
        reader = csv.reader(file)
        CSV_columns_header = next(reader)
        list_of_measured_properties = CSV_columns_header[2:]
        estimated_number_of_columns = number_of_masks * \
            estimated_number_of_markers*len(list_of_measured_properties)
        data_matrix = np.zeros((estimated_number_of_rows,estimated_number_of_columns+1),dtype=float, order = 'C')

        for line in file:
            line_list = line.split(',')
            label = line_list[1]
            strings_from_label = label.split(':')  # [0] image, [1] id, [2] mask, [3] marker
            cell_id = int(strings_from_label[1])

            if cell_id >= max_cell_id:
                    max_cell_id = cell_id
            mask = strings_from_label[2]
            marker_string = strings_from_label[3].split(' ')[0]  # discard opal, if available
            allowed = set(ascii_letters + ' '+'0,1,2,3,4,5,6,7,8,),9,(')
            marker = ''.join(l for l in marker_string if l in allowed)
            starting_column_label = marker + "_" +  list_of_measured_properties[0] +"_"+ mask

            if starting_column_label not in list_of_column_labels:
               temp_list=(list(map(lambda measured_property: marker\
                      +"_"+ measured_property +"_"+ mask, list_of_measured_properties)))
               [list_of_column_labels.append(list_item) for list_item in temp_list]
            starting_index_of_column= list_of_column_labels.index(starting_column_label)
            data_matrix[cell_id][0] = cell_id
            line_list_value = []
            [line_list_value.append(float(number)) for number in line_list[2:]]
            values = line_list_value[0:-1]
            data_matrix[cell_id][starting_index_of_column:(starting_index_of_column+len(values))] = values
    ## shrink the estimated number of lines to actual number of lines
    data_matrix = data_matrix[0:max_cell_id][:]
    ## change the data type to list to include the header which
    ## is a string
    data_table = data_matrix.tolist()
    ## add the labels/ marker names to the list of lists
    data_header = list_of_column_labels
    data_table[0] = data_header
    with open(csv_file_name[0:-4]+'.csv','w', newline='') as result_file:
        wr = csv.writer(result_file, dialect = 'excel')
        wr.writerows(data_table)
