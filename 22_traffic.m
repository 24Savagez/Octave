pkg load image

clc, clear all

img = imread("test1.jpg");
figure(1)
imshow(img)

imghsv = rgb2hsv(img);

bw = im2bw(imghsv);
figure(2)
imshow(bw)

g = imfill(bw,"holes");
figure(3)
imshow(g)

[centers,radii] = imfindcircles(imghsv,[20 80]);
figure(4)
imshow(g)
viscircles(centers,radii)


