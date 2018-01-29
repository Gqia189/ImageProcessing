function [frequentNumber] = EstimateBackgroundValue(gray)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author:Gary Qian
%Date created : 23/08/2016
%Ddate last edited : 23/07/2016
%task description: a fuction that estimates the background value for an
%image by finding the most commonly occuring interger in the 2D array.
%input:a 2D array representing a gray scale image
%output:the most frequently occuring value in the 2D array
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%turns the 2D array gray into a 1D array
image = gray(:)';
%find the most frequent intensity
frequentNumber = mode(image);

end

