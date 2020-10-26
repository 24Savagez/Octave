#Octave test
pkg load image
# perform iteration
clear all
clc
#Matrix
img = imread('peppers_Bluehills.png');
figure(1)

#show the image
imshow(img)

#check matrix size
varsize = size(img)

#show color on roll and collumn and color
temp = img(1,1,1)
#1:red 2:green 3:blue

#create K,C,M and Y
K = zeros(varsize(1),varsize(2));

C = zeros(varsize(1),varsize(2));

M = zeros(varsize(1),varsize(2));

Y = zeros(varsize(1),varsize(2));

#max
#max(img(i,j,:)));
#max(img(i,j,1),img(i,j,2),img(i,j,3));

#K
for i = 1:varsize(1)
  for j = 1:varsize(2)
    K(i,j) = (2^16)-(max(img(i,j,:)));
    C(i,j) = (2^16)-(img(i,j,1))-(img(i,j,2))/K(i,j);
    M(i,j) = (2^16)-(img(i,j,2))- K(i,j)/(2^16)-K(i,j);
    Y(i,j) = (2^16)-(img(i,j,3))- K(i,j)/(2^16)-K(i,j);
    
  endfor
endfor
K = uint16(K);
C = uint16(C);
M = uint16(M);
Y = uint16(Y);

figure(2)
imshow(K)

figure(3)
imshow(C)

figure(4)
imshow(M)

figure(5)
imshow(Y)