#Noise Removal
clear all,clc

#Open a box to select the image to process
[filename,fpath] = uigetfile({"*.gif;*.png;*.jpg","Choose the image"});

#read the image
img = imread([fpath,filename]);

#show image
figure(1)
imshow(img);
title('Original');

varsize = size(img);
imgz = double(img);
NoiseRemoval = imgz;

for i = 1+1 :varsize(1)-1;
  for j = 1+1 :varsize(2)-1;
    NoiseRemoval(i,j) =(imgz(i-1,j-1)+imgz(i,j-1)+imgz(i+1,j-1)...
                    +imgz(i-1,j)+imgz(i,j)+imgz(i+1,j)...
                    +imgz(i-1,j+1)+imgz(i,j+1)+imgz(i+1,j+1))/9;
  endfor
endfor

nosieRemoval = uint8(round(NoiseRemoval));

figure(2)
imshow(nosieRemoval);
title('NoiseRemoval')



