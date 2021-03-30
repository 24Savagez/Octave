clc 
clear all

pkg load image


img = imread("test3.png");
img = NoiseRemovals(img);
[nrow,ncol,color] = size(img);
figure(1)
imshow(img)

threshold = 100/255;
g_img = img(:,:,1);
bw_img_green = im2bw(g_img,threshold);
bw_img_green = imfill(bw_img_green,"holes");

g_img = img(:,:,2);
bw_img_red = im2bw(g_img,threshold);
bw_img_red = imfill(bw_img_red,"holes");

g_img = img(:,:,3);
bw_img_yellow = im2bw(g_img,threshold);
bw_img_yellow = imfill(bw_img_yellow,"holes");

figure(2)
subplot(1,3,1)
imshow(bw_img_green)
title("green")

subplot(1,3,2)
imshow(bw_img_red)
title("red")

subplot(1,3,3)
imshow(bw_img_yellow)
title("yellow")

m_g = imclearborder(bw_img_green);
m_r = imclearborder(bw_img_red);
m_y = imclearborder(bw_img_yellow);

figure(3)
subplot(1,3,1)
imshow(m_g)
title("green")

subplot(1,3,2)
imshow(m_r)
title("red")

subplot(1,3,3)
imshow(m_y)
title("yellow")

color_img_green = zeros(nrow,ncol,color);
color_img_red = zeros(nrow,ncol,color);
color_img_yellow = zeros(nrow,ncol,color);


for i = 1:nrow
  for j = 1:ncol
    if m_g(i,j) == 0
      color_img_green(i,j,1:2) = img(i,j,1:2);
    endif
    if m_r(i,j) == 0
      color_img_red(i,j,1:2) = img(i,j,1:2);
    endif
    if m_y(i,j) == 0 && bw_img_green(i,j) == 1 && bw_img_red(i,j) == 1
      color_img_yellow(i,j,1:2) = img(i,j,1:2);
    endif
  endfor
endfor





color_img_green = uint8(color_img_green);
color_img_red = uint8(color_img_red);
color_img_yellow = uint8(color_img_yellow);

figure(4)
subplot(1,3,1)
imshow(color_img_green)
title("green")

subplot(1,3,2)
imshow(color_img_red)
title("red")

subplot(1,3,3)
imshow(color_img_yellow)
title("yellow")