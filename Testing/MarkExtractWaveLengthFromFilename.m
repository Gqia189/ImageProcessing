function [mark] = MarkExtractWaveLengthFromFilename(specifiedFunctionName)
% Marks the ImageEnergy function
% note that no marks are awarded if the function returns values of the
% wrong type.
%
% It has an optional argument specifiedFunctionName, which can be used
% to specify a different filename for the function,
% Use the optional argument if the user has mispelt their function name
%
% ExtractWaveLengthFromFilename has as Input:
% A string containing the filename of an image.
% Output
% The wave length associated with the image, returned as a double.  
% This will be the three digit value that is sandwiched between the 
% characters '_f' and 'n_' (if a narrowband filter was used) or the
% '_f' and 'm_' (if a mediumband filter was used).or the '_f' and 'w_' 
% (if a wideband filter was used).   If a wave length could not be 
% extracted because the file name does not follow the naming convention 
% a value of -1 should be returned.
%
% author: Peter Bier

% default the function name to ExtractWaveLengthFromFilename, if no
% optional arg specified
if nargin == 0
    functionName = 'ExtractWaveLengthFromFilename';
else
    functionName = specifiedFunctionName;
end

% set up  test data
load TestData

% set up filenames for inputs
input1 =  ExtractWaveLengthFromFilenameInput1;

% set up expected numerical output values
expectedOutput = ExtractWaveLengthFromFilenameExpectedOutput;
purpose = ExtractWaveLengthFromFilenamePurpose;
totalPassed = 0;
numTests = length(input1);

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

