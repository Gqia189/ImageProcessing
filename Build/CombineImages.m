function [ image ] = CombineImages( imageArray )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author:Gary Qian
%Date created : 28/08/2016
%Ddate last edited : 01/09/2016
%task description: combine a set of coloured images of various tints to form a single RGB image
%input: a cell array containing images
%output: a 3D array representing a combined image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%creates a 3D array the same size as the first image in the cell array
image = 0 * imageArray{1};

%loops through every image in the cell array then adds their individual elements toghether.
i = 1;
while i <= length(imageArray)
    image = image + imageArray{i};
    i = i+1;
end

image = uint8(image);

end

