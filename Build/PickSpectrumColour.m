function [red,green,blue] = PickSpectrumColour(titleMessage,figNum)
% Displays a spectrum colour bar, using the specified figure namber and 
% allows the user to select a point to pick a colour,
% the red, green and blue values of the selected point are returned
% inputs: titleMessage, a message to display as the title of the figure
%         figureNumber, the figure number to display the spectrum on
% outputs: red, amount of red (in the range 0 to 255)
%          green, amount of green (in the range 0 to 255)
%          blue, amount of blue (in the range 0 to 255)
% NOTE: this function uses the SpectrumBar function which YOU MUST WRITE
% 
% Author: Peter Bier
% Version: 2 (typo on titleMessage variable fixed)

% specify spectrum bar range
lowWaveLength = 380;
highWaveLength = 700;

% get a spectrum bar
% YOU MUST WRITE SpectrumBar for this function to work
S=SpectrumBar(lowWaveLength,highWaveLength);

% display bar
figure(figNum)
imshow(S)
title(titleMessage);

% get a point within the correct range of columns 
% i.e. between 1 and the width of the bar inclusive
barwidth = highWaveLength - lowWaveLength + 1;
colpick = 0;

while colpick <1 || colpick > barwidth
    [x,y] = ginput(1); % get coordinates.
    colpick = round(x); % calculate column
end

% x corresponds to the column, 
% grab the corresponding colour from the spectrum bar
red = S(1,colpick,1);
green = S(1,colpick,2);
blue = S(1,colpick,3);
