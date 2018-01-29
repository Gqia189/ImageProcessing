% Process Hubble telescope images
% This script forms the basis for a program to process raw images from
% the Hubble telescope and produce a colour image visulisation of a
% section of space.
% Some functions have been provided and you are required to implement
% the remainder.
% Please see the project specification document for more information.
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

% display raw images as figure 1
% YOU NEED TO WRITE DisplayCellImages
DisplayCellImages(layer,'Raw image', 1)

% Calculate the background and peak values for each imager or determine
% them manually using the provided FetchBackgroundAndPeakValue function
% NOTE: for debugging purposes you may find it useful to hardcode some
% values for the supplied images, that produce reasonably nice
% results.  If you have yet to implement EstimateBackgroundValue try
% using the following values as a reasonable default choice.
b=[105 125 35 95]; % default background values for supplied images

manualSelection = input('Do you want to select background and peak points manually? (y or n):','s');

for i=1:nfiles
    
    % raw image
    I = layer{i};
    
    if strncmp(lower(manualSelection),'n',1)
        
        % YOU NEED TO WRITE EstimateBackgroundValue
        % it will pick the most common value as the background value
        background(i) = EstimateBackgroundValue(I);
        
        % for debugging purposes, you can comment out the above line
        % until you have implemented EstimateBackgroundValue and 
        % uncomment the line below to use some hardcoded defaults
        % background(i) = b(i);
        
        peak(i) = 255; % default p to 255
    else
        % use supplied function to fetch background and peak values
        [background(i),peak(i)] = PickBackgroundAndPeakValues(I,2);
        
    end
end


% Normalise and display normalised versions
for i=1:nfiles
    I = layer{i};
    % calculate normalisation of image
    % YOU NEED TO WRITE NormaliseImage
    N{i} = NormaliseImage(I,background(i),peak(i));
end

% display normalised images as figure 2
DisplayCellImages(N,'Normalised', 3)

manualColour = input('Do you want to assign colours manually? (y or n):','s');

% Colour the images based either on the colour of the light wave length
% for the filter or a manually assigned colour choice
for i=1:nfiles
    
    % determine the wave length used for this file
    % YOU NEED TO WRITE ExtractWaveLengthFromFilename
    w = ExtractWaveLengthFromFilename(filenames{i});
    
    % convert a wave length into an RGB value using wave length or manual
    % choice
    
    if strncmp(lower(manualColour),'n',1)
        % auto convert the wave length to equivalent RGB values
        % YOU NEED TO WRITE WaveLengthToRGB
        [red,green,blue]=WaveLengthToRGB(w);
    else
        % manually pick the colour from a spectrum
        % YOU NEED TO WRITE SpectrumColourPicker (and the associated
        % function SpectrumBar that it uses)
        message = ['Select colour to use for wave length ' num2str(w)];
        [red,green,blue]=PickSpectrumColour(message,4);
    end
    
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
imwrite(C,'combined.jpg');

% Optional for experts (for bonus marks)
% write an AutoRotate function to align the image nicely, so that the edges
% of the WFPC section of the image are parallel to the image edges
% (see project specification example)
% NOTE: this is super hard!!
R=AutoRotate(C);

% Write an AutoCrop function to crop the image nicely, once it has been
% rotated
% NOTE: this is a little tricky but not as hard as AutoRotate
F=AutoCrop(R);




