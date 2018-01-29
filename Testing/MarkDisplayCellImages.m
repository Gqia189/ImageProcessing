function [mark] = MarkDisplayCellImages(specifiedFunctionName)
% Marks the DisplayCellImages function
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% Note the DisplayCellImages function takes the following Inputs (in order):
% 1) A 1D cell array containing one or more images. The images could be 
% either greyscale images stored in 2D arrays (of type uint8) or RGB colour 
% images stored in 3D arrays (of type uint8).
% 2) A string containing a message to use at the start of each subplot 
% title (each subplot will be titled using this message followed by a space
% and then an image number).
% 3) A number to use when creating the figure (i.e. a value to pass in when 
% calling the figure command).
% Output: NONE (the function displays a figure so does not need to return 
% any values).
% author: Peter Bier

% default the function name to DisplayCellImages, if no optional arg specified
if nargin == 0
    functionName = 'DisplayCellImages';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData

% setup cell arrays of images to display
input1 = {firstFigure, secondFigure, thirdFigure, fourthFigure, ...
    fifthFigure, sixthFigure};

% set up strings to display for title
input2 = {'First', 'Second', 'Third', 'Fourth', 'Fifth' 'Sixth'};

% set up figure numbers
input3 = [1,2,3,4,5,6];

purpose = DisplayCellImagesPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\t', functionName, i, purpose{i});   
    disp(m);
    try
        
        feval(functionName,input1{i},input2{i},input3(i));
        
    catch ex
        ProcessMarkingException(ex, functionName)
    end
    
end

% request manual check of images
disp('Refer to the marking document for what the images should look like');
totalPassed = input('Please enter number of test images that are correct:');
      
% display marks summary 
allocatedMarks = 3;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);

