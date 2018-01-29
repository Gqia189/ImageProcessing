function [waveLength] = ExtractWaveLengthFromFilename( fileName )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author:Gary Qian
%Date created : 26/08/2016
%Ddate last edited : 06/09/2016
%task description: Extracts the wavelength of the image from given filename
%input:a string containing the filename of an image
%output:a 3 digit wavelength number corresponding to the image (returns in double)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%find the position in which _f is at in the filename then store as pos
pos = strfind(fileName,'_f');

%determines whether _f occurs once in the string 
if isempty(pos) == 0 && length(pos) == 1
    %determines whether the _f is ended by a n_(narrow) or a
    %m_(medium) or a w_(wide) band.
    if strcmp(fileName((pos+5):(pos+6)),'n_')|| strcmp(fileName((pos+5):(pos+6)),'m_')|| strcmp(fileName((pos+5):(pos+6)),'w_')
        %scans for a decimal interger that is betweem _f and n_ or m_ or w_ 
        waveLength = sscanf(fileName(pos:length(fileName)),'_f%d');
        %determines whether the decimal interger is 3 digits
        if (waveLength < 100) || (waveLength > 999)
            waveLength = -1;
        end
    else
        %returns -1 if _f is not followed by n or m or w 5 positions across
        waveLength = -1;
    end
else
    %returns -1 if _f does not occur in the string
    waveLength = -1;
end
waveLength = double(waveLength);
end

