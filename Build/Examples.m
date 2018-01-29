% Function call examples from the project specification
% These examples are meant as a starting point for testing your code
% You should also come up with your own tests to ensure your code
% works as specified in the project document.

disp('Examples of calling DisplayCellImages');

% make three grey images of different shades and assign to cell array
grey{1} = ones(100,'uint8')*64;
grey{2} = ones(100,'uint8')*128;
grey{3} = ones(100,'uint8')*192;
DisplayCellImages(grey,'Grey image',1)

% make two random colour images and assign to cell array
colour{1} = uint8(255*rand(100,100,3));
colour{2} = uint8(255*rand(100,100,3));
DisplayCellImages(colour,'Random colour',2)

disp('Examples of calling EstimateBackgroundValue');

% set up a small 2x4 array of unit8 values
A =uint8( [128 255 128  0; 0 0 255 64] );
a = EstimateBackgroundValue(A) % will return 0

% set up a small 3x4 array of unit8 values
B =uint8( [3 2 1; 0 0 0; 1 2 3; 1 1 3] );
b = EstimateBackgroundValue(B) % will return 1

% set up a 3x6 array of unit8 values
C = zeros(3,6,'uint8');
C(1,:) = 100; % set row 1 to 100
C(2,:) = 50; % set row 2 to 50
C(3,:) = 200; % set row 3 to 200
c = EstimateBackgroundValue(C) % will return 50

disp('Examples of calling NormaliseImage');

% set up a small 2x4 array of unit8 values
A =uint8( [128 255 128  0; 0 0 255 64] );
NA = NormaliseImage(A,0,255) % no change

% set up a small 3x4 array of unit8 values
B =uint8( [3 2 1; 0 0 0; 1 2 3; 1 1 3] );
NB1 = NormaliseImage(B,0,3)
NB2 = NormaliseImage(B,1,3)
NB3 = NormaliseImage(B,2,3) 

% set up a 3x6 array of unit8 values
C = zeros(3,6,'uint8');
C(1,:) = 100; % set row 1 to 100
C(2,:) = 50; % set row 2 to 50
C(3,:) = 200; % set row 3 to 200
NC1 = NormaliseImage(C,50,200)
NC2 = NormaliseImage(C,50,100)

disp('Examples of calling ExtractWaveLengthFromFilename');

f1 = 'hst_05773_05_wfpc2_f502n_wf_sci.tif'
w = ExtractWaveLengthFromFilename(f1) % will return 502

f2 = 'hst_05773_05_wfpc2_f555w_wf_sci.tif'
w = ExtractWaveLengthFromFilename(f2) % will return 555

f3 = 'hlsp_clash_hst_acs-30mas_a383_f625w_v1_drz.tif'
w = ExtractWaveLengthFromFilename(f3) % will return 625

f4 = 'image.tif'
w = ExtractWaveLengthFromFilename(f4) % will return -1

f5 = 'hst_05773_05_wfpc2_f547m_wf_sci.tif'
w = ExtractWaveLengthFromFilename(f5) % will return 547

disp('Examples of calling WaveLengthToRGB');

[R,G,B]=WaveLengthToRGB(400) % gives 170,0,255
[R,G,B]=WaveLengthToRGB(500) % gives 0,255,128
[R,G,B]=WaveLengthToRGB(580) % gives 255,255,0
[R,G,B]=WaveLengthToRGB(800) % gives 0,0,0

disp('Examples of calling SpectrumBar');

S=SpectrumBar(400,500) % will produce a 100x101x3 array
figure(1)
imshow(S)

S=SpectrumBar(400,800) % will produce a 100x401x3 array
figure(2)
imshow(S)

disp('Examples of calling ColourImage');

% create a greyscale image
G = zeros(128,'uint8'); 
for i=1:128
    for j=1:128
        G(i,j)=i+j;
    end
end
C1=ColourImage(G,255,0,0); % colour it with pure red
C2=ColourImage(G,0,0,255); % colour it with pure blue
C3=ColourImage(G,255,255,0); % colour it with yellow
figure(1)
subplot(1,4,1)
imshow(G)
subplot(1,4,2)
imshow(C1)
subplot(1,4,3)
imshow(C2)
subplot(1,4,4)
imshow(C3)

disp('Example of calling CombineImages');

% create a greyscale image
G = zeros(128,'uint8'); 
for i=1:128
    for j=1:128
        G(i,j)=i+j;
    end
end
C{1}=ColourImage(G,255,0,0); % colour it with pure red
C{2}=ColourImage(G,0,0,255); % colour it with pure blue
T=CombineImages(C) % should produce a purple image
figure(2)
imshow(T)
