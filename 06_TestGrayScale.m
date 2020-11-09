clear all , clc

img = imread("peppers_trees.png");

imGray = GrayScale(img);

#show image
subplot(1,2,1)
imshow(img);
title('Original');

subplot(1,2,2)
imshow(imGray);
title('GrayScale');
