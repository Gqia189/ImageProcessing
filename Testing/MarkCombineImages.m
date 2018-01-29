function [mark] = MarkCombineImages(specifiedFunctionName)
% Marks the CombineImages function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% The CombineImages function has as input
% a 1D cell array containing 1 or more colour images (each image will be a
% 3D array of unsigned 8 bit integers).  It is assumed that all images will
% have the same size.
% Output:
% A 3D array of unsigned 8 bit integers representing the combined image.
%
% author: Peter Bier

% default the function name to CombineImages, if no optional arg specified
if nargin == 0
    functionName = 'CombineImages';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData

input1 = CombineImagesInput1;
expectedOutput = CombineImagesExpectedOutput;
purpose = CombineImagesPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        output{i} = feval(functionName,input1{i});
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

