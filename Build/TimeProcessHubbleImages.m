% Timed version of Process Hubble telescope images
% This script times how long your code takes to run
% It is a cut down version of the ProcessHubbleImages script
% with no user interaction and excludes the time take to read and write
% friles from disc (as this can take a long time if writing to a
% flashdrive)
%
% Use this script to measure your performance once you have completed tasks
% 1 through 8 inclusive (The bonus mark tasks are not timed)
% To obtain a time simply hit the "Run button".
%
% Note hat when developing it can be helpful to use the
% "Run and time" button instead to profile your code.  This will let you know
% where bottle necks are. Be aware however that using the "Run and time"
% button will slow  execution time down substantially as Matlab uses a
% lot of resources while profiling your code.
%
% Author: Peter Bier
% Date: 18th August 2016

clear
clf

% path to directory containing tif images, edit as appropriate
dirPath = 'G:\enggen 131\MatlabProjectRelease\EagleNebula\';

% get tif files from specified directory using provided FetchTifFiles
% function
filenames = GetTifFiles(dirPath);
nfiles = length(filenames);

% read in all the tif files
for i=1:nfiles
    % read in an image
    layer{i}=imread([dirPath filenames{i}]);
end

% start the clock
tic

% display raw images as figure 1
% YOU NEED TO WRITE DisplayCellImages
DisplayCellImages(layer,'Raw image', 1)

% Calculate the background and peak values for each image

for i=1:nfiles
    
    % raw image
    I = layer{i};
    
    % YOU NEED TO WRITE EstimateBackgroundValue
    % it will pick the most common value as the background value
    background(i) = EstimateBackgroundValue(I);
    
    % for debugging purposes, you can comment out the above line
    % until you have implemented EstimateBackgroundValue and
    % uncomment the line below to use some hardcoded defaults
    % background(i) = b(i);
    
    peak(i) = 255; % default p to 255
    
    % normalise images based on background and peak values
    % YOU NEED TO WRITE NormaliseImage
    N{i} = NormaliseImage(I,background(i),peak(i));
    
end

% display normalised images as figure 2
DisplayCellImages(N,'Normalised', 3)


% Colour the images based either on the colour of the light wave length
% for the filter or a manually assigned colour choice
for i=1:nfiles
    
    % determine the wave length used for this file
    % YOU NEED TO WRITE ExtractWaveLengthFromFilename
    w = ExtractWaveLengthFromFilename(filenames{i});
    
    % convert a wave length into an RGB value using wave length or manual
    % choice
    
    % auto convert the wave length to equivalent RGB values
    % YOU NEED TO WRITE WaveLengthToRGB
    [red,green,blue]=WaveLengthToRGB(w);
    
    
    % tint the image
    % YOU NEED TO WRITE ColourImage
    T{i}=ColourImage(N{i},red,green,blue);
    
end

DisplayCellImages(T,'Coloured', 5)
%input('Images Coloured, hit enter to continue');

% combine and display the result
% YOU NEED TO WRITE CombineImages
C=CombineImages(T);

% display your combined image in all its glory
figure(6)
imshow(C)

% stop the clock
toc

imwrite(C,'combined.jpg');

AutoRotate(C);

