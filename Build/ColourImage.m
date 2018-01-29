function [tinted] = ColourImage(gray,r,g,b)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author:Gary Qian
%Date created : 29/08/2016
%Ddate last edited : 01/09/2016
%task description: Colours in a grayscale image 
%input: a 2D array representing a grayscale image, a set of RGB values
%output: a 3D array in unit8 to represent a tinted coloured image    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%converts all inputs into double from uint8
gray = double(gray);
r = double(r);
g = double(g);
b = double(b);

%Calculates the individual layers of the tinted image
%then combines the 2D array layers into the 3D array tinted
tinted(:,:,1) = (r*gray)/255;
tinted(:,:,2) = (g*gray)/255;
tinted(:,:,3) = (b*gray)/255;

%converts 3D array to unit8 to represent image
tinted = uint8(tinted);

end

