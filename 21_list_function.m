clear all,clc

pkg load image 

[filename,fpath] = uigetfile({"*.gif;*.png;*.jpg","Choose the image"});

img = imread([fpath,filename]);
figure(1)
imshow(img)
title("original")

h = imhist(img);
figure(2)
imhist(img)
title("imhist")

bw = im2bw(img);
figure(3)
imshow(bw);
title("im2bw")

%bw2 = im2bw(img,thresh);

j = histeq(img);
figure(4)
imshow(j)
title("histeq")

g = imfill(bw,"holes");
figure(5)
imshow(g)
title("imfill")

[centers,radii] = imfindcircles(img,[10 50]);
figure(6)
imshow(img)
viscircles(centers,radii)
title("detected circles")

cc=regionprops(g,'all');
centroid = cat(1,cc.Centroid);
figure(7)
imshow(img)
hold on 
plot(centroid(:,1), centroid(:,2), 'b*')
title("centroid display")
hold off

boundingbox = bwboundaries(g);
figure(8)
imshow(img)
hold on
for k = 1:numel(boundingbox)
  plot(boundingbox{k}(:,2), boundingbox{k}(:,1),'r','linewidth',2);
endfor
title("boundaies displayed")
hold off

h = fspecial("gaussian");
im = imread("peppers_trees.png");
j = imfilter(im,h);
figure(9)
imshow(j)
title("imfilter")

m = imclearborder(g);
figure(10)
imshow(m)
title("imclearborder")

cc=regionprops(m,'all');
centroid = cat(1,cc.Centroid);
figure(11)
imshow(m)
hold on 
plot(centroid(:,1), centroid(:,2), 'b*')
title("centroid display")
hold off







