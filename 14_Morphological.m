clear all,clc
pkg load image

[file,fpath] = uigetfile({"*.jpg;*.png","choose the image"});

img = imread([fpath,file]);
VThreshold = 100;

final_img = Binarizations(img,VThreshold);

se_disk = strel("disk", 5, 0);
se_diamond = strel("diamond", 5);

imOut1 = imclose(img, se_disk);
imOut2 = imnoise(img, "gaussian");

figure(1)
imshow(imOut1);

figure(2)
imshow(imOut2);

