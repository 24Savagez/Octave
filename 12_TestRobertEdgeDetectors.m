clear all , clc

[file,fpath] = uigetfile({"*.jpg;*.png","Choose the image"});

img = imread ([fpath,file]);
img = GrayScale(img,'basic');

edgeDetection = RobertEdgeDetectors(img);

subplot(1,2,1)
imshow(img);
title('Original');

subplot(1,2,2)
imshow(edgeDetection);
title('RobertEdgeDetectorsedgeDetection');