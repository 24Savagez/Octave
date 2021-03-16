clc 
clear all

pkg load image


img = imread("test1.jpg");
[nrow,ncol,color] = size(img);
figure(1)
imshow(img)

threshold = 150/255;
g_img = img(:,:,1);
ycbcrim = rgb2ycbcr(img);
g_img2 = ycbcrim(:,:,3);
bw_img = im2bw(g_img,threshold);
figure(2)
imshow(bw_img)
figure(3)
imshow(g_img2)

color_img = zeros(nrow,ncol,color);


for i = 1:nrow
  for j = 1:ncol
    if bw_img(i,j) == 0
      color_img(i,j,1) = img(i,j,1);
      color_img(i,j,2) = img(i,j,2);
      color_img(i,j,3) = img(i,j,3);
    endif
  endfor
endfor

color_img = uint8(color_img);
figure(4)
imshow(color_img)




