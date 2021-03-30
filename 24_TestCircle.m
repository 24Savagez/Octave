clc
clear all

pkg load image

img = imread("test3.png");
im_fil = imfilter (img, fspecial ("average", 3));
bw_img = im2bw(img,(100/255));
centers = imfindcircles(bw_img,[40 120]);
 
figure(1)
imshow(img)

figure(2)
imshow(im_fil)


figure(3)
imshow(bw_img)


[centers, radii] = imfindcircles (bw_img, [20 60]);
figure(4)
hold on
imshow(bw_img)
viscircles (centers, radii)
title ("found circles in red")
hold off

