clear all , clc

[file,fpath] = uigetfile({"*.gif;*.jpg;*.jng","Choose the image"});

img = imread([fpath,file]);

imgRemoval = NoiseRemovals(img);

subplot(1,2,1)
imshow(img);
title('Original');

subplot(1,2,2)
imshow(imgRemoval);
title('NoiseRemovals');



