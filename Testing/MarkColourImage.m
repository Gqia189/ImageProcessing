function [mark] = MarkColourImage(specifiedFunctionName)
% Marks the ColourImage function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% ColourImage has Inputs ( in order)
% 1) A 2D array of unsigned 8 bit integers representing a greyscale image.
% 2) A red intensity value, r_in (in the range 0 to 255), stored as an
% unsigned 8 bit integer.
% 3) A green intensity value, g_in (in the range 0 to 255), stored as an
% unsigned 8 bit integer.
% 4) A blue intensity value, b_in (in the range 0 to 255), stored as an
% unsigned 8 bit integer.
% Output:
% A 3D array of unsigned 8 bit integers representing a tinted colour image.
% The image will have the same number of rows and columns as the 2D image
% passed in as the first input value.  It will have 3 layers, to represent
% the different values of R, G and B for each pixel.
%
% author: Peter Bier

% default the function name to ColourImage, if no optional arg specified
if nargin == 0
    functionName = 'ColourImage';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData


input1 = ColourImageInput1;
input2 = ColourImageInput2;
input3 = ColourImageInput3;
input4 = ColourImageInput4;

expectedOutput = ColourImageExpectedOutput;
purpose = ColourImagePurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        output{i} = feval(functionName,input1{i},input2(i),input3(i),input4(i));
        % check if result returned closely matches the expected result
        
        if isequal(expectedOutput{i},output{i})
            totalPassed = totalPassed + 1;
            disp([m 'Passed test']);
        else
            disp([m 'FAILED test']);
            
        end
        
    catch ex
        disp([m 'FAILED test']);
        
        ProcessMarkingException(ex, functionName)
    end
    
end

% display marks summary
allocatedMarks = 3;
mark = ProcessMarksSummary(functionName,totalPassed,numTests,allocatedMarks);

