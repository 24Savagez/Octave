#perform iteration
clear all , clc

#import image
img = imread("peppers_BlueHills.png");

#check mattrix size
varsize = size(img);

#define variable for fill array
basic = zeros(varsize(1),varsize(2));
luminance = zeros(varsize(1),varsize(2));
desaturation = zeros(varsize(1),varsize(2));

#Convert image color to grayscale 3 way
for i = 1:varsize(1)
  for j = 1:varsize(2)
    %1
    basic(i,j) = (img(i,j,1)+img(i,j,2)+img(i,j,3))/3;
    %2
    luminance(i,j) = (0.30*(img(i,j,1)))+(0.59*(img(i,j,2)))+(0.11*(img(i,j,3)));
    %3
    desaturation(i,j) = ((max(img(i,j,:)))+(min(img(i,j,:))))/2;
  endfor
endfor

basic = uint16(round(basic));
luminance = uint16(round(luminance));
desaturation = uint16(round(desaturation));

subplot(2,2,1)
imshow(img)
title('Original')

subplot(2,2,2)
imshow(basic)
title('basic')

subplot(2,2,3)
imshow(luminance)
title('luminance')

subplot(2,2,4)
imshow(desaturation)
title('desaturation')
