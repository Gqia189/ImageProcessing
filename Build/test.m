image = imread('combined_07375.tif');

Igray = double(rgb2gray(image));


BW2 = edge(Igray,'prewitt');
%BW2 = edge(image,'prewitt');

% Perform the Hough transform
[H, theta, rho] = hough(BW2);
% Find the peak pt in the Hough transform
peak = houghpeaks(H);
% Find the angle of the bars
barAngle = theta(peak(2));

rotated = imrotate(image,barAngle,'bilinear','crop');




figure(),imshow(rotated);
imwrite(rotated,'rotated.jpg');
