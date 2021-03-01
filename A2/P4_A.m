
photo = rgb2gray(imread('u2cuba.jpg'));
template = rgb2gray(imread('trailer.png'));
figure('Name','Original photo');
imshow(photo, [], 'InitialMagnification', 50);
figure('Name','template');
imshow(template, [] , 'InitialMagnification', 50);
correlationImg = normxcorr2(template, photo);
surf(correlationImg)
shading flat
[ypeak,xpeak] = find(correlationImg==max(correlationImg(:)));
yoffSet = ypeak-size(template,1);
xoffSet = xpeak-size(template,2);
% Displays correlationImg and draw a rectangle around the highest peak.
figure('Name','Correlation, near-perfect template');
hold on % Allows drawing on top of the displayed image
imshow(correlationImg, [], 'InitialMagnification', 50);

% Find the maximum of correlationImg.
% The max function requires a vector, so we unroll the array with (:).
% The max function returns both the value of the maximum value and its
% linear index within the array. We don't care about the value of the
% maximum, so we discard the first output value with using the ~ notation.
[~, maxValLinearIndex] = max(correlationImg(:));

% We use the ind2sub function to convert a linear back into matrix
% coordinates.
[y, x] = ind2sub(size(correlationImg), maxValLinearIndex);

% Display a rectangle around the peak we just found.
rectangle('Position', [x-15, y-15, 30, 30], 'EdgeColor', 'r')
hold off;
