function [mark] = MarkWaveLengthToRGB(specifiedFunctionName)
% Marks the WaveLengthToRGB function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% The WaveLengthToRGB function takes  as Input
% A wave length (measured in nanometres), e.g. the value 400.
% Outputs (in order)
%1)	A red intensity value (in the range 0 to 255) for the specified
% wave length, returned as an unsigned 8 bit integer (uint8).
%2)	A green intensity value (in the range 0 to 255) for the specified
% wave length, returned as an unsigned 8 bit integer (uint8).
%3)	A blue intensity value (in the range 0 to 255) for the specified
% wave length, returned as an unsigned 8 bit integer (uint8).
% author: Peter Bier

% default the function name to WaveLengthToRGB, if no optional arg specified
if nargin == 0
    functionName = 'WaveLengthToRGB';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData

input1 = WaveLengthToRGBInput1;

expectedOutput1 = WaveLengthToRGBExpectedOutput1;
expectedOutput2 = WaveLengthToRGBExpectedOutput2;
expectedOutput3 = WaveLengthToRGBExpectedOutput3;

purpose = WaveLengthToRGBPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        [output1,output2,output3] = feval(functionName,input1(i));
        % check if result returned closely matches the expected result
        
        if isequal(expectedOutput1(i),output1) && ...
                isequal(expectedOutput2(i),output2) && ...
                isequal(expectedOutput3(i),output3)  
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

