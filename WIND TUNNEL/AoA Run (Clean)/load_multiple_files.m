clear all; clc

[file_list, path_n] = uigetfile('.csv', 'Grab the files you want to process', 'MultiSelect', 'on');

if iscell(file_list) == 0
    file_list = {file_list};
end

for i = 1:length(file_list)
    filename = file_list(i);
    data_in = readtable([path_n filename]);
    
end
    