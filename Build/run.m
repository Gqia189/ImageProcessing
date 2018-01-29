img = imread('rotated.jpg'); % read image and convert it to double in range [0..1]

gray = rgb2gray(img);


BW = edge(gray, 'prewitt');


% Get all rows and columns where the image is nonzero
[nonZeroRows, nonZeroColumns] = find(BW);
% Get the cropping parameters
topRow = min(nonZeroRows(:));
bottomRow = max(nonZeroRows(:));
leftColumn = min(nonZeroColumns(:));
rightColumn = max(nonZeroColumns(:));
% Extract a cropped image from the original.
croppedImage = img(topRow:bottomRow, leftColumn:rightColumn,1:3);
% Display the original gray scale image.
figure()
imshow(croppedImage);
