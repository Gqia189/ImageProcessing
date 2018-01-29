function [mark] = MarkNormaliseImage(specifiedFunctionName)
% Marks the NormaliseImage function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% NormaliseImage taks as Inputs (in order)
% 1) A greyscale image to normalise (stored as a 2D array of unsigned 8 bit
% integers).
% 2) A “background” value (that will become the darkest value).  This will
% be an unsigned 8 bit integer value in the range 0 to 255 inclusive.
% 3) A "peak" value (that will become the brightest value).  This will be
% an unsigned 8 bit integer value in the range 0 to 255 inclusive and is
% assumed to be larger than the background value.
% Output: A 2D array of unsigned 8 bit integers containing the normalised
% greyscale image.
%
% author: Peter Bier

% default the function name to NormaliseImage, if no optional arg specified
if nargin == 0
    functionName = 'NormaliseImage';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData

% set up greyscale images to use for tests
input1 = NormaliseImageInput1;
% set up background values (uint8 values)
input2 = NormaliseImageInput2;

% set up peak values (uint8 values)
input3 = NormaliseImageInput3;

% set up expected outputs
expectedOutput = NormaliseImageExpectedOutput;

purpose = NormaliseImagePurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        output{i} = feval(functionName,input1{i},input2{i},input3{i});
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

