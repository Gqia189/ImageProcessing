function [ cropped ] = AutoCrop( image )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author:Gary Qian
%Date created : 29/08/2016
%Ddate last edited : 10/09/2016
%task description: crop image so that it only displays area of interest
%input: a image
%output: a cropped image that displays area of interest
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%convert image to grayscale
gray = rgb2gray(image);

%convert grayscale image to Binary
Binary = edge(gray, 'prewitt');

%find all nonzeros rows and columns
[rows, cols] = find(Binary);

%find co-ordinates for cropping
topRow = min(rows(:));
bottomRow = max(rows(:));
leftColumn = min(cols(:));
rightColumn = max(cols(:));

%crop image
cropped = image(topRow:bottomRow, leftColumn:rightColumn,1:3);

end

