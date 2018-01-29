function [rotated] = AutoRotate(image)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author:Gary Qian
%Date created : 29/08/2016
%Ddate last edited : 10/09/2016
%task description: rotates image so it lines up
%input: a tilted image in the form of a 3D array
%output: a lined up image in the form of a 3D array
%algorithm from http://cn.mathworks.com/help/images/ref/hough.html
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%convert from RGB to a Grayscale image
Igray = double(rgb2gray(image));

%find edges using the prewitt filter
Binary = edge(Igray,'prewitt');

%use the Hough transform to find lines of the edges of the image
[H, theta, rho] = hough(Binary);

%find the peaks of hough transformation 
peak = houghpeaks(H);

%find the angle between the line and horizontal
barAngle = theta(peak(2));

%lines up the image 
rotated = imrotate(image,barAngle,'bilinear');
figure(),imshow(rotated);
imwrite(rotated,'rotated.jpg');

end

