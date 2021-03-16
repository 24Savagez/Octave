#Octave test
pkg load image
#perform iteration
clear all, close all
clc
#Matrix
img = imread('peppers_Bluehills.png');
%figure(1)
#show the image
%imshow(img)
%title('Original')

#check matrix size
varsize = size(img);

#show color on roll and collumn and color
%temp = img(1,1,1)
#1:red 2:green 3:blue

newimg = zeros(varsize(1),varsize(2));
newimg = double(img)/(2^16);

Rc = double(img(:,:,1))/(2^16);
Gc = double(img(:,:,2))/(2^16);
Bc = double(img(:,:,3))/(2^16);

#RGB colorspace to CMYK
#create K,C,M and Y variable
K =zeros(varsize(1),varsize(2));
C =zeros(varsize(1),varsize(2));
M =zeros(varsize(1),varsize(2));
Y =zeros(varsize(1),varsize(2));
#create R,G,B variable
R = zeros(varsize(1),varsize(2));
G = zeros(varsize(1),varsize(2));
B = zeros(varsize(1),varsize(2));

RGBF = zeros(varsize(1),varsize(2),varsize(3));
KCMYF = zeros(varsize(1),varsize(2),varsize(3));

#max
#max(img(i,j,:)));
#max(img(i,j,1),img(i,j,2),img(i,j,3));

for i = 1:varsize(1)
  for j = 1:varsize(2)
    #RGB covert to KCMY
    K(i,j) = (1-max([Rc(i,j),Gc(i,j),Bc(i,j)]));  
    C(i,j) = (1-Rc(i,j)-K(i,j))/(1-K(i,j));
    M(i,j) = (1-Gc(i,j)-K(i,j))/(1-K(i,j));
    Y(i,j) = (1-Bc(i,j)-K(i,j))/(1-K(i,j));
    #KCMY convert to RGB
    R(i,j) = (1-C(i,j))*(1-K(i,j));
    G(i,j) = (1-M(i,j))*(1-K(i,j));
    B(i,j) = (1-Y(i,j))*(1-K(i,j));
    
    %RGBF(i,j,1) = R(i,j);
    %RGBF(i,j,2) = G(i,j);
    %RGBF(i,j,3) = B(i,j);
    
    %KCMYF(i,j,1) = C(i,j);
    %KCMYF(j,j,2) = M(i,j);
    %KCMYF(j,j,3) = Y(i,j);
   endfor
endfor   
#sort 3 layer to 1 picture
RGBF(:,:,1) = R;
RGBF(:,:,2) = G;
RGBF(:,:,3) = B;

KCMYF(:,:,1) = C;
KCMYF(:,:,2) = M;
KCMYF(:,:,3) = Y;

K = uint16(round(K*(2^16)));
C = uint16(round(C*(2^16)));
M = uint16(round(M*(2^16)));
Y = uint16(round(Y*(2^16)));

R = uint16(round(R*(2^16)));
G = uint16(round(G*(2^16)));
B = uint16(round(B*(2^16)));

RGBF = uint16(round(RGBF*(2^16)));
KCMYF = uint16(round(KCMYF*(2^16)));

%figure(2)
%imshow(K)
%title('K')

%figure(3)
%imshow(C)
%title('C')

%figure(4)
%imshow(M)
%title('M')

%figure(5)
%imshow(Y)
%title('Y')

%figure(6)
%imshow(R)
%title('R')

%figure(7)
%imshow(G)
%title('G')

%figure(8)
%imshow(B)
%title('B')

%figure(9)
%imshow(RGBF)
%title('Covert from KCMY')

figure(1)
imshow(Rc)
title('Covert from RGB')

figure(2)
subplot(3,3,1);
  imshow(img)
  title('Original');
subplot(3,3,2);
  imshow(K)
  title('K');
subplot(3,3,3);
  imshow(C)
  title('C');
subplot(3,3,4);
  imshow(M)
  title('M');
subplot(3,3,5);
  imshow(Y)
  title('Y');
subplot(3,3,6);
  imshow(R)
  title('R');
subplot(3,3,7);
  imshow(G)
  title('G');
subplot(3,3,8);
  imshow(B)
  title('B');
subplot(3,3,9);
  imshow(RGBF)
  title('RGBF');