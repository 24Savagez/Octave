clear all , clc

img = imread("CameraMan.JPG");
figure(1)
imshow(img)

#if image RGB or Color must convert to grayscale
imggray = GrayIM(F);
figure(2)
imshow(imggray)

varsize = size(img);
newimg = double(img);

binarization = zeros(varsize(1),varsize(2));

VThresh = 128;

#algorithm
for i = 1:varsize(1)
  for j = 1:varsize(2)
    if newimg(i,j) > VThresh
      binarization(i,j) = 1;
     else 
      binarization(i,j) = 0;
    endif
  endfor
endfor

figure(3)
imshow(binarization)

