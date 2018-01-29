function [R,G,B] = WaveLengthToRGB(w)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author:Gary Qian
%Date created : 28/08/2016
%Ddate last edited : 01/09/2016
%task description: approximates the inputed wavelength into a equivalent
%set of RGB values
%input: a wavelength 
%output: a set of RGB(red,green,blue) values as a uint8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%check which range the wavelength is within
if w < 380
    R = 0;
    G = 0;
    B = 0;
elseif w <= 440
    R = (440-w)/60;
    G = 0;
    B = 1;
elseif w <= 490
    R = 0;
    G = (w-440)/50;
    B = 1;
elseif w <= 510
    R = 0;
    G = 1;
    B = (510-w)/20;
elseif w <= 580
    R = (w-510)/70;
    G = 1;
    B = 0;
elseif w <= 645
    R = 1;
    G = (645-w)/65;
    B = 0;
elseif w <= 780
    R = 1;
    G = 0;
    B = 0;
else
    R = 0;
    G = 0;
    B = 0;
end

%coverts RGB values into unit8
R = uint8(R*255);
G = uint8(G*255);
B = uint8(B*255);


end

