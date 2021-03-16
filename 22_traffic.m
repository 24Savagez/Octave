pkg load image

clc, clear all

img = imread("test1.jpg");
[varsize] = size(img);
figure(1)
imshow(img)

G_img = zeros(varsize(1),varsize(2));

color_img = img(:,:,1);
for i = 1:varsize(1)
  for j = 1:varsize(2)
    if color_img(i,j) < 136 && color_img(i,j) > 56
      G_img(i,j) = 255;
    endif
  endfor
endfor

color_img2 = uint8(G_img);
figure(2)
imshow(color_img2)




