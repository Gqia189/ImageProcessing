function [mark] = MarkEstimateBackgroundValue(specifiedFunctionName)
% Marks the EstimateBackgroundValue function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% EsitmateBackgroundValue has Input:
% A 2D array of uint8 values representing a greyscale image.
% And Output :The most common value in the array (returned as a unit8).
% If there are several values that are the most common (because they occur
% the same number of times) then the lowest of these is returned.
% author: Peter Bier

% default the function name to EstimateBackgroundValue, if no optional arg specified
if nargin == 0
    functionName = 'EstimateBackgroundValue';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData

% set up cell arrays of images to use as inputs for each test
input1 = EstimateBackgroundValueInput1;

% set up expected outputs
expectedOutput = EstimateBackgroundValueOutput;

purpose = EstimateBackgroundValuePurpose;

numTests = length(input1);
totalPassed = 0;
% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        output(i) = feval(functionName,input1{i});
        % check if result returned closely matches the expected result
        
        if isequal(expectedOutput(i),output(i))
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

