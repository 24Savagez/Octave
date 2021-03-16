pkg load image

clc, clear all

img = imread("test1.jpg");
[nrow,ncol] = size(img);
figure(1)
imshow(img)

threshold = 200/255;
g_img = img(:,:,1);
bw_img = im2bw(g_img,threshold);
figure(2)
imshow(bw_img)

color_img = zeros(nrow,ncol/3,3);


for i = 1:nrow
  for j = 1:ncol/3
    if bw_img == 0
      color_img(i,j,1) = img(i,j,1);
      color_img(i,j,2) = img(i,j,2);
      color_img(i,j,3) = img(i,j,3);
    endif
  endfor
endfor

figure(3)
imshow(color_img)




