pkg load image

clc, clear all

img = imread("red_lights.jpg");
figure(1)
imshow(img)


gray = rgb2gray (img);
figure(2)
imshow(gray)



bw = im2bw(gray);
figure(3)
imshow(bw)

h = imhist(gray);
figure(4)
imhist(gray)
