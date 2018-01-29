function [b,p] = PickBackgroundAndPeakValues(I,figureNumber)
% Displays a greyscale image, using the specified figure namber and allows
% the user to select points for a background value and peak value on the 
% image, the values at these points are returned.
% inputs: I, a grescale image(2D array of type uint8)
%         figureNumber, the figure number to display the image on
% outputs: b, a background value (in the range 0 to 255)
%          p, a peak value (in the range 0 to 255)
% NOTE: this function uses the ginputc command, which is available from
% the mathworks file exchange (and was included with the supplied project
% files).  You can also use the built-in ginput command but that doesn't
% give you control of the crosshair colour
% Author: Peter Bier

% calculate image size (remembering it is a 2D array)
% we will need this later to check clicked points are within the bounds of
% the image
[rn,cn]=size(I);

% open pecified figure number
figure(figureNumber)
imshow(I);
title('Please click on the background value (red crosshairs) and then the peak value (blue crosshairs)');

validPoint = false;
while validPoint == false
    % use the customisable version of ginput (provided) to grab point for
    % background value
    [x, y] = ginputc(1, 'Color', 'r');
    % plot point in red to give feedback to user, so they know point was
    % clicked
    
    % calculate row and column of I that correspond to the background vlaue
    % note that ginputc returns an array of x coordinates and y coordinates
    % the first output corresponds to the x coordinate (horizontal position)
    % as measured from the top left corner (it is equivalent to the column)
    % the second output corresponds to the y coordinate (vertical position)
    % as measured from the top left corner with values increasing as you
    % move DOWN the image (it is equivalent to the row)
    bRow = round(y(1));   % row number is the y coordinate
    bCol = round(x(1));   % col number is the x coordinate
    
    % check if point is within image bounds
    if bRow>=1 && bRow <=rn && bCol>=1 && bCol<=cn
        
        %valid point
        validPoint = true;
        b=I(bRow,bCol); % find value
        % plot it
        hold on
        plot(x,y,'r+')
    end
end


validPoint = false;
while validPoint == false
    % use the customisable version of ginput (provided) to grab point for
    % peak value
    [x, y] = ginputc(1, 'Color', 'b');
    
    % calculate row and column of I that correspond to the peak vlaue
    pRow = round(y(1));
    pCol = round(x(1));
    
    if pRow>=1 && pRow <=rn && pCol>=1 && pCol<=cn
        validPoint = true;
        
        p=I(pRow,pCol); % find value
        plot(x,y,'b+');
        
    end
end

end
