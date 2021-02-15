%% Introduction to image processing workshop - semester two%% You can run this code and check the results in the "Command Window"%% Mathematical morphology image function%%   /\%%  /!!\%% /!!!!\  Make sure that you load the image package using%%/______\ "pkg load image"%% Basic examples of Mathematical morphology: cameraman image%% Made by Romuald Jolivot for BU introduction to image processing workshop % Clear all previous data use clear function and closing all potential windows using close function for all dataclear all, close all%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Load image into a variable%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Load an image using dialog box function uigetfile% uigetfile function to get the file path and file name%[filename, filepath]=uigetfile({"*.png;*.jpg","Choose cameraman image to load"});% load the image using file path and file name put into Diskd bracked and separated with a comma ,%Im = imread([filepath,filename]);%% Load an image with the file name Im = imread("text.png");%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Structuring element: Rectangle% Size 2 3SESQ3=strel("rectangle",[2 3]);% Size 3 5SESQ5=strel("rectangle",[3 5]);% Size 5 7SESQ7=strel("rectangle",[5 7]);% Apply erosion using Rectangle with different size% Erosion Rectangle [2 3]ImErSq3 = imerode(Im,SESQ3);% Erosion Rectangle [3 5]ImErSq5 = imerode(Im,SESQ5);% Erosion Rectangle [5 7]ImErSq7 = imerode(Im,SESQ7);% Display the results for Erosion Rectangle [2 3], [3 5], [5 7]figure(1)subplot(2,2,1)imshow(Im)title("Original Image")subplot(2,2,2)imshow(ImErSq3)title("Erosion Rectangle [2 3]")subplot(2,2,3)imshow(ImErSq5)title("Erosion Rectangle [3 5]")subplot(2,2,4)imshow(ImErSq7)title("Erosion Rectangle [5 7]")% Apply dilation using Disk with different size% Dilation Rectangle [2 3]ImDiSq3 = imdilate(Im,SESQ3);% Dilation Rectangle [3 5]ImDiSq5 = imdilate(Im,SESQ5);% Dilation Rectangle [5 7]ImDiSq7 = imdilate(Im,SESQ7);% Display the results for Dilation Rectangle [2 3], [3 5], [5 7]figure(2)subplot(2,2,1)imshow(Im)title("Original Image")subplot(2,2,2)imshow(ImDiSq3)title("Dilation Rectangle [2 3]")subplot(2,2,3)imshow(ImDiSq5)title("Dilation Rectangle [3 5]")subplot(2,2,4)imshow(ImDiSq7)title("Dilation Rectangle [5 7]")% Apply opening using Disk with different size% Opening Rectangle [2 3]ImOpSq3 = imopen(Im,SESQ3);% Opening Rectangle [3 5]ImOpSq5 = imopen(Im,SESQ5);% Opening Rectangle [5 7]ImOpSq7 = imopen(Im,SESQ7);% Display the results for opening Rectangle [2 3], [3 5], [5 7]figure(3)subplot(2,2,1)imshow(Im)title("Original Image")subplot(2,2,2)imshow(ImOpSq3)title("Opening Rectangle [2 3]")subplot(2,2,3)imshow(ImOpSq5)title("Opening Rectangle [3 5]")subplot(2,2,4)imshow(ImOpSq7)title("Opening Rectangle [5 7]")% Apply closing using Disk with different size% Closing Rectangle [2 3]ImClSq3 = imclose(Im,SESQ3);% Closing Rectangle [3 5]ImClSq5 = imclose(Im,SESQ5);% Closing Rectangle [5 7]ImClSq7 = imclose(Im,SESQ7);% Display the results for Closing Rectangle [2 3], [3 5], [5 7]figure(4)subplot(2,2,1)imshow(Im)title("Original Image")subplot(2,2,2)imshow(ImClSq3)title("Closing Rectangle [2 3]")subplot(2,2,3)imshow(ImClSq5)title("Closing Rectangle [3 5]")subplot(2,2,4)imshow(ImClSq7)title("Closing Rectangle [5 7]")%% Applying erosion twiceImErSq3_2 = imerode(ImErSq3,SESQ3);figure(5)subplot(1,3,1)imshow(Im)title("Original Image")subplot(1,3,2)imshow(ImErSq3)title("Erosion Rectangle [2 3]")subplot(1,3,3)imshow(ImErSq3)title("Erosion Rectangle [2 3] x2")%% Applying dilation twiceImDiSq3_2 = imdilate(ImDiSq3,SESQ3);figure(6)subplot(1,3,1)imshow(Im)title("Original Image")subplot(1,3,2)imshow(ImDiSq3)title("Dilation Rectangle [2 3]")subplot(1,3,3)imshow(ImDiSq3_2)title("Dilation Rectangle [2 3] x2")%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Add salt and pepper noiseImAddNoise = imnoise(double(Im), "salt & pepper",0.02);% Apply erosion using Disk with different size% Erosion Rectangle [2 3]ImErSq3Noise = imerode(ImAddNoise,SESQ3);% Erosion Rectangle [3 5]ImErSq5Noise = imerode(ImAddNoise,SESQ5);% Erosion Rectangle [5 7]ImErSq7Noise = imerode(ImAddNoise,SESQ7);% Display the results for Erosion Disk 3figure(7)subplot(2,2,1)imshow(ImAddNoise)title("Noisy Image")subplot(2,2,2)imshow(ImErSq3Noise)title("Erosion Rectangle [2 3]")subplot(2,2,3)imshow(ImErSq5Noise)title("Erosion Rectangle [3 5]")subplot(2,2,4)imshow(ImErSq7Noise)title("Erosion Rectangle [5 7]")% Apply dilation using Disk with different size% Dilation Disk 3ImDiSq3Noise = imdilate(ImAddNoise,SESQ3);% Dilation Rectangle [2 3]ImDiSq5Noise = imdilate(ImAddNoise,SESQ5);% Dilation Disk 3ImDiSq7Noise = imdilate(ImAddNoise,SESQ7);% Display the results for Dilation Rectangle [2 3], [3 5], [5 7]figure(8)subplot(2,2,1)imshow(ImAddNoise)title("Noisy Image")subplot(2,2,2)imshow(ImDiSq3Noise)title("Dilation Disk 5")subplot(2,2,3)imshow(ImDiSq5Noise)title("Dilation Rectangle [3 5]")subplot(2,2,4)imshow(ImDiSq7Noise)title("Dilation Rectangle [5 7]")% Apply opening using Disk with different size% Opening Disk 5ImOpSq3Noise = imopen(ImAddNoise,SESQ3);% Opening Rectangle [3 5]ImOpSq5Noise = imopen(ImAddNoise,SESQ5);% Opening Rectangle [5 7]ImOpSq7Noise = imopen(ImAddNoise,SESQ7);% Display the results for opening Rectangle [2 3], [3 5], [5 7]figure(9)subplot(2,2,1)imshow(ImAddNoise)title("Noisy Image")subplot(2,2,2)imshow(ImOpSq3Noise)title("Opening Rectangle [2 3]")subplot(2,2,3)imshow(ImOpSq5Noise)title("Opening Rectangle [3 5]")subplot(2,2,4)imshow(ImOpSq7Noise)title("Opening Rectangle [5 7]")% Apply closing using Disk with different size% Closing Rectangle [2 3]ImClSq3Noise = imclose(ImAddNoise,SESQ3);% Closing Rectangle [3 5]ImClSq5Noise = imclose(ImAddNoise,SESQ5);% Closing Rectangle [5 7]ImClSq7Noise = imclose(ImAddNoise,SESQ7);% Display the results for Closing Rectangle [2 3], [3 5], [5 7]figure(10)subplot(2,2,1)imshow(ImAddNoise)title("Noisy Image")subplot(2,2,2)imshow(ImClSq3Noise)title("Closing Rectangle [2 3]")subplot(2,2,3)imshow(ImClSq5Noise)title("Closing Rectangle [3 5]")subplot(2,2,4)imshow(ImClSq7Noise)title("Closing Rectangle [5 7]")%% Applying erosion twiceImErSq3_2Noise = imerode(ImErSq3Noise,SESQ3);figure(11)subplot(1,3,1)imshow(ImAddNoise)title("Noisy Image")subplot(1,3,2)imshow(ImErSq3Noise)title("Erosion Rectangle [2 3]")subplot(1,3,3)imshow(ImErSq3_2Noise)title("Erosion Rectangle [2 3] x2")%% Applying dilation twiceImDiSq3_2Noise = imdilate(ImDiSq3Noise,SESQ3);figure(12)subplot(1,3,1)imshow(ImAddNoise)title("Noisy Image")subplot(1,3,2)imshow(ImDiSq3Noise)title("Dilation Rectangle [2 3]")subplot(1,3,3)imshow(ImDiSq3_2Noise)title("Dilation Rectangle [2 3] x2")%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Getting External gradient, Internal gradient and Gradient image% External gradient = Image dilated (with 3x3 Disk) - Image originalExtGradientIm = ImDiSq3 - Im;% Internal gradien = Image original - Image eroded (with 3x3 Disk)IntGradientIm = Im - ImErSq3;GradientImage = ExtGradientIm - IntGradientIm;% Display result of gradientsfigure(13)subplot(2,2,1)imshow(Im)title("Original Image")subplot(2,2,2)imshow(ExtGradientIm)title("External Gradient Image")subplot(2,2,3)imshow(IntGradientIm)title("Internal Gradient Image")subplot(2,2,4)imshow(GradientImage)title("Gradient Image")