clc 
clear all

pkg load image


img = imread("test3.png");
img = NoiseRemovals(img);
[nrow,ncol,color] = size(img);
figure(1)
imshow(img)

threshold = 150/255;
g_img = img(:,:,1);
bw_img_green = im2bw(g_img,threshold);

g_img = img(:,:,2);
bw_img_red = im2bw(g_img,threshold);

g_img = img(:,:,3);
bw_img_yellow = im2bw(g_img,threshold);

figure(2)
subplot(1,3,1)
imshow(bw_img_green)
title("green")

subplot(1,3,2)
imshow(bw_img_red)
title("red")

subplot(1,3,3)
imshow(bw_img_red)
title("yellow")

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
    if bw_img_red(i,j) == 1 && bw_img_green(i,j) == 1 && bw_img_yellow(i,j) == 0
      color_img_yellow(i,j,:) = img(i,j,:);
    endif
  endfor
endfor

color_img_green = uint8(color_img_green);
color_img_red = uint8(color_img_red);
color_img_yellow = uint8(color_img_yellow);
figure(3)
subplot(2,2,1)
imshow(img)
subplot(2,2,2)
imshow(color_img_green)
subplot(2,2,3)
imshow(color_img_red)
subplot(2,2,4)
imshow(color_img_yellow)

[centers,radii] = imfindcircles(color_img_green,[40 120]);
figure(4)
imshow(img)
viscircles(centers,radii)
title("detected green")

[centers,radii] = imfindcircles(color_img_red,[40 120]);
figure(5)
imshow(img)
viscircles(centers,radii)
title("detected red")

[centers,radii] = imfindcircles(color_img_yellow,[40 120]);
figure(6)
imshow(img)
viscircles(centers,radii)
title("detected yellow")



