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

figure(2)
imshow(bw_img_green)
title("green")

m_g = imclearborder(bw_img_green);

figure(3)
imshow(m_g)
title("green")

color_img_green = zeros(nrow,ncol,color);

for i = 1:nrow
  for j = 1:ncol
    if m_g(i,j) == 0
      color_img_green(i,j,:) = img(i,j,:);
    endif 
  endfor
endfor
color_img_green = uint8(color_img_green);
figure(4)
imshow(color_img_green)
title("green")

img_bw2 = im2bw(color_img_green,(60/255));
figure(5)
imshow(img_bw2)
title("img_bw2")

varsize = size(img_bw2);
just_g = zeros(varsize(1),varsize(2));
for i = 1:varsize(1)
  for j = 1:varsize(2)
    if img_bw2(i,j) == 0
      just_g(i,j) = 0;
    else
      just_g(i,j) = 1;
     endif
  endfor
endfor
figure(6)
imshow(just_g)
title("just_g")

green_2 = imclearborder(just_g);
figure(7)
imshow(green_2)
title("imclearborder_g")

centers_g = imfindcircles(green_2,[40 120]);
[centers_g, radii_g] = imfindcircles (green_2, [20 60]);
figure(8)
hold on
imshow(img)
viscircles (centers_g, radii_g)
title ("found circles in Green")
hold off

