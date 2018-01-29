function [] = DisplayCellImages(image, titleName, figureNumber)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Author:Gary Qian
%Date created : 23/08/2016
%Ddate last edited : 05/09/2016
%task description: a function that can display images stored in a 1D cell
%array on a single figure.
%input: a 1D cell array containing images, a string containing the title,
%a number for creating figures
%output: nothing(fuction should display a figure)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%assigns the inputed figurenumber to the figure
figure(figureNumber)

%Plot all the images in the cell array in a row
for i = 1:length(image)
    subplot(1,length(image),i);
    imshow(image{i});
    %creates a string from the input titleName and the images' position in
    %the cell array
    str = sprintf('%s %d',titleName,i);
    %displays string as the title above each image
    title(str)
end

end


