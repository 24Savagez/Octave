clc 
clear all

pkg load image


img = imread("test1.jpg");
[nrow,ncol,color] = size(img);
figure(1)
imshow(img)

threshold = 150/255;
g_img = img(:,:,1);
bw_img_green = im2bw(g_img,threshold);

g_img = img(:,:,2);
bw_img_red = im2bw(g_img,threshold);


color_img_green = zeros(nrow,ncol,color);
color_img_red = zeros(nrow,ncol,color);
color_img_yellow = zeros(nrow,ncol,color);


for i = 1:nrow
  for j = 1:ncol
    if bw_img_green(i,j) == 0
      color_img_green(i,j,:) = img(i,j,:);
    endif
    if bw_img_red(i,j) == 0
      color_img_red(i,j,:) = img(i,j,:);
    endif
    if bw_img_red(i,j) == 1 && bw_img_green(i,j) == 1
      color_img_yellow(i,j,:) = img(i,j,:);
    endif
  endfor
endfor

color_img_green = uint8(color_img_green);
color_img_red = uint8(color_img_red);
color_img_yellow = uint8(color_img_yellow);
figure(2)
imshow(color_img_green)
figure(3)
imshow(color_img_red)
figure(4)
imshow(color_img_yellow)




