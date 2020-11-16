clear all , clc

#import image and define intensity
img = imread('CameraMan.JPG');

#if image color must convert to GrayScale
%imgColor = imread('CameraMan.jpg');
%img = GrayScale(imgColor);

VThreshold = 128;

#call functions
FinalImage = Binarizations(img,VThreshold);

#show image
subplot(1,2,1)
imshow(img)
title('Original')

subplot(1,2,2)
imshow(FinalImage)
title('Binarizations')

