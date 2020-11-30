clear all , clc

[file,fpath] = uigetfile({"*.jpg;*.jng","Choose the image"});

img = imread ([fpath,file]);

edgeDetection = EdgeDetectors(img);

subplot(1,2,1)
imshow(img);
title('Original');

subplot(1,2,2)
imshow(edgeDetection);
title('edgeDetection');