function [spectrum] = SpectrumBar(lowest,highest)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author:Gary Qian
%Date created : 28/08/2016
%Ddate last edited : 03/09/2016
%task description: Creates a spectrum bar that is 100 pixels in height and
%and covers a specified range of wavelengths
%input: the largest wavelength, and the smallest wavelength
%output: a 3D array in uint8 to represent a spectrum bar
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%determines the specified range of wavelength spectrum bar needs to cover
range = (highest - lowest + 1);

%preassigns the size of the spectrum bar
spectrum = zeros(100,range,3);

%loops through each column of spectrum
for i = 1:range
    
    %determines the RGB values associated with each wavelength
    [R,G,B]=WaveLengthToRGB(lowest);
    
    %assigns RGB values to the corresponding layers of spectrum
    spectrum(:,i,1) = R;
    spectrum(:,i,2) = G;
    spectrum(:,i,3) = B;
    
    lowest = lowest + 1;
    
end

%coverts 3D array (spectrum bar) to uint8
spectrum = uint8(spectrum);

end

