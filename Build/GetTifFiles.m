function [ filenames ] = GetTifFiles( dirName )
% Gets all tif file names for any tif files in a specified directory
% input: dirName, the path to the directory
% output: a CELL array containing a list of filenames
% author: Peter Bier

dirData = dir(dirName);
count = 0;
for i=1:length(dirData)
    filename = dirData(i).name; % grab the file name from the file struct
    len = length(filename);
    % check if file name is long enough to be a potential tif file
    % and then check the extension
    if len>4 && strcmp('.tif',filename(len-3:len))
        % add to list if it ends in .tif
        count = count+1;
        filenames{count} = filename;
    end
end
end

