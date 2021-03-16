% Octave test to consider specific  color thresholding
% Load image package
pkg load image

% Clear the workspace and close figures
clear all, close all, clc

% Open a box to select the image to process
[filename, fpath] = uigetfile({"*.gif;*.png;*.jpg", "Choose the image to be analysed"});
% Read the image
Img = imread([fpath,filename]); 

%Show the image
figure(1)
imshow(Img);
title('Original image')

% Convert into different color space
% to HSV
hsvim = rgb2hsv(Img);

% to YCbCr
ycbcrim = rgb2ycbcr(Img);


% Plot the result of the image conversion
figure(2)
subplot(3,3,1)
imshow(Img(:,:,1))
title('R')
subplot(3,3,2)
imshow(Img(:,:,2))
title('G')
subplot(3,3,3)
imshow(Img(:,:,3))
title('B')
subplot(3,3,4)
imshow(hsvim(:,:,1))
title('H')
subplot(3,3,5)
imshow(hsvim(:,:,2))
title('S')
subplot(3,3,6)
imshow(hsvim(:,:,3))
title('V')
subplot(3,3,7)
imshow(ycbcrim(:,:,1))
title('Y')
subplot(3,3,8)
imshow(ycbcrim(:,:,2))
title('Cb')
subplot(3,3,9)
imshow(ycbcrim(:,:,3))
title('Cr')


% Plot the histogram
figure(3)
subplot(3,3,1)
imhist(Img(:,:,1))
title('R')
subplot(3,3,2)
imhist(Img(:,:,2))
title('G')
subplot(3,3,3)
imhist(Img(:,:,3))
title('B')
subplot(3,3,4)
imhist(hsvim(:,:,1))
title('H')
subplot(3,3,5)
imhist(hsvim(:,:,2))
title('S')
subplot(3,3,6)
imhist(hsvim(:,:,3))
title('V')
subplot(3,3,7)
imhist(ycbcrim(:,:,1))
title('Y')
subplot(3,3,8)
imhist(ycbcrim(:,:,2))
title('Cb')
subplot(3,3,9)
imhist(ycbcrim(:,:,3))
title('Cr')