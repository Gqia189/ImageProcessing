function [mark] = MarkSpectrumBar(specifiedFunctionName)
% Marks the SpectrumBar function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% SpectrumBar takes as Inputs (in order)
% 1) A low wave length value (this will be used to colour the pixels
% in the first column of the image).
% 2) A high wave length value (this will be used to colour the pixels
% in the last column of the image).
% Output:
% A 3D array of unsigned integers representing a spectrum bar that spans
% the wave length range.  Each successive column of pixels corresponds to
% the colour of a wavelength 1 nanometre higher than the previous one.
% The array will have 100 rows, n columns and 3 layers where the number of
%columns is given by n=h_w-l_w+1, where h_w is the highest wave length and
% l_w is the lowest wave length.
%
% author: Peter Bier

% default the function name to SpectrumBar, if no optional arg specified
if nargin == 0
    functionName = 'SpectrumBar';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData

input1 = SpectrumBarInput1;
input2 = SpectrumBarInput2;
expectedOutput = SpectrumBarExpectedOutput;

purpose = SpectrumBarPurpose;

totalPassed = 0;
numTests = length(input1);

% run all tests, comparing expected output against actual output
for i = 1:numTests
    m = sprintf('%s Test %i\n\tPurpose:\t%s \n\tResult:\t\t', functionName, i, purpose{i});
    
    try
        
        output{i} = feval(functionName,input1(i),input2(i));
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


