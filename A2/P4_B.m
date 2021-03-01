% Read in the  main image and the template image.
photo = rgb2gray(imread('u2cuba.jpg'));


% Display the image and the template at the same magnification, to make 
% clear that the template is an extremely close match for the relevant 
% section of the image.
figure('Name','Original photo');
imshow(photo, [], 'InitialMagnification', 50);
largerTemplate = rgb2gray(imread('trailerSlightlyBigger.png'));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                           YOUR CODE HERE: Part (b)                           %
%             Repeat the process from (a) with the larger template.            %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
mismatchedCorrelationImg = [];
mismatchedCorrelationImg = normxcorr2(largerTemplate, photo);
surf(correlationImg)
shading flat
[ypeak,xpeak] = find(mismatchedCorrelationImg==max(mismatchedCorrelationImg(:)));
yoffSet = ypeak-size(largerTemplate,1);
xoffSet = xpeak-size(largerTemplate,2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                              %
%                               END OF YOUR CODE                               %
%                                                                              %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Display mismatchedCorrelationImg.
figure('Name', 'Correlation, larger-sized template');
hold on;
imshow(mismatchedCorrelationImg, [], 'InitialMagnification', 50);

% Repeat the same process as above: find the maximum of correlationImg and
% draw a box around it.
[~, maxValLinearIndex] = max(mismatchedCorrelationImg(:));
[y, x] = ind2sub(size(mismatchedCorrelationImg), maxValLinearIndex);
rectangle('Position', [x-15, y-15, 30, 30], 'EdgeColor', 'r')
hold off;