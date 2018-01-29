function [n] = NormaliseImage( image, background, peak )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author:Gary Qian
%Date created : 23/08/2016
%Ddate last edited : 05/09/2016
%task description: To improve the contrast of the images by normalising the
%the gray scale image.
%input: a 2D array representing a grey scale image, a darkest value(background), a brightest value(peak)
%output: a 2D array representing the normalised grayscale image returned as
%a uint8 value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%change all inputs to double for calculation
image = double(image);
background = double(background);
peak = double(peak);

%calculates the normalised 2D array (normalised grayscale image) and
%returns back as a unit8 value
n = uint8(255 * (image - background)/(peak - background));

end


