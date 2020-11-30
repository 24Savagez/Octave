clear all , clc

[file,fpath] = uigetfile({"*.jpg;*.png","Choose the image"});

img = imread([fpath,file]);
varsize = double(img);
hist1 = zeros(1,(2^8)+1);
hist2 = zeros(1,(2^8)+1);

for i = 1:varsize(1);
  for j = 1:varsize(2);
          pixel = img(i,j);
          hist1(pixel+1) = hist1(pixel+1)+1;
  endfor
endfor

for p = 1:((2^8)+1);
  if p == 1 ;
    hist2(p) = hist1(p);
  else
    hist2(p) = hist1(p) + hist2((p)-1);
    
  endif
endfor
subplot(1,3,1)
imshow(img);
title('image');

subplot(1,3,2)
plot(hist1);
title('Histogram');

subplot(1,3,3)
plot(hist2);
title('Histogram02');