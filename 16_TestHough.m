clear all, close all
[file,fpath] = uigetfile({"*.jpg;*.png","Choose your image"});
img = imread([fpath,file]);

bi_img = Binarizations(img,230);

SE=strel("square",3);

Imdil = imdilate(bi_img, SE);

ExtGrad = Imdil - bi_img;

subplot(2,3,1)
imshow(img)
title("Original")

subplot(2,3,2)
imshow(Imdil)
title("imdilate")

subplot(2,3,3)
imshow(ExtGrad)
title("ExtGrad")

