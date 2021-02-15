%% Introduction to image processing workshop - semester two%% You can run this code and check the results in the "Command Window"%% Mathematical morphology image function%%   /\%%  /!!\%% /!!!!\  Make sure that you load the image package using%%/______\ "pkg load image"%% Basic examples of Mathematical morphology: cameraman image%% Made by Romuald Jolivot for BU introduction to image processing workshop % Clear all previous data use clear function and closing all potential windows using close function for all dataclear all, close all%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Load image into a variable%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Load an image using dialog box function uigetfile% uigetfile function to get the file path and file name%[filename, filepath]=uigetfile({"*.png;*.jpg","Choose cameraman image to load"});% load the image using file path and file name put into squared bracked and separated with a comma ,%Im = imread([filepath,filename]);%% Load an image with the file name Im = imread("coins.png");%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Structuring element: line% Size 5, 0 degreeSESQ3=strel("line",5,0);% Size 5, 45 degreeSESQ5=strel("line",5,45);% Size 5, 90 degreeSESQ7=strel("line",5,90);% Apply erosion using line, size 5 and 0, 45, 90 degree% Erosion Line size 5, 0 degreeImErSq3 = imerode(Im,SESQ3);% Erosion Line size 5, 45 degreeImErSq5 = imerode(Im,SESQ5);% Erosion Line size 5, 90 degreeImErSq7 = imerode(Im,SESQ7);% Display the results for Erosion Line 5figure(1)subplot(2,2,1)imshow(Im)title("Original Image")subplot(2,2,2)imshow(ImErSq3)title("Erosion Line 5, 0")subplot(2,2,3)imshow(ImErSq5)title("Erosion Line 5, 45")subplot(2,2,4)imshow(ImErSq7)title("Erosion Line 5, 90")% Apply dilation using square with different size% Dilation Line size 5, 0 degreeImDiSq3 = imdilate(Im,SESQ3);% Dilation Line size 5, 45 degreeImDiSq5 = imdilate(Im,SESQ5);% Dilation Line 5, 90ImDiSq7 = imdilate(Im,SESQ7);% Display the results for Dilation Line 5, 0, 45, 90figure(2)subplot(2,2,1)imshow(Im)title("Original Image")subplot(2,2,2)imshow(ImDiSq3)title("Dilation Line 5, 0")subplot(2,2,3)imshow(ImDiSq5)title("Dilation Line 5, 45")subplot(2,2,4)imshow(ImDiSq7)title("Dilation Line 5, 90")% Apply opening using Line 5, 0, 45, 90% Opening Line 5, 0ImOpSq3 = imopen(Im,SESQ3);% Opening Line 5, 45ImOpSq5 = imopen(Im,SESQ5);% Opening Line 5, 90ImOpSq7 = imopen(Im,SESQ7);% Display the results for opening Line 5, 0, 45, 90figure(3)subplot(2,2,1)imshow(Im)title("Original Image")subplot(2,2,2)imshow(ImOpSq3)title("Opening Line 5, 0")subplot(2,2,3)imshow(ImOpSq5)title("Opening Line 5, 45")subplot(2,2,4)imshow(ImOpSq7)title("Opening Line 5, 90")% Apply closing using Line 5, 0, 45, 90% Closing Line 5, 0ImClSq3 = imclose(Im,SESQ3);% Closing Line 5, 45ImClSq5 = imclose(Im,SESQ5);% Closing Line 5, 90ImClSq7 = imclose(Im,SESQ7);% Display the results for Closing Line 5, 0, 45, 90figure(4)subplot(2,2,1)imshow(Im)title("Original Image")subplot(2,2,2)imshow(ImClSq3)title("Closing Line 5, 0")subplot(2,2,3)imshow(ImClSq5)title("Closing Line 5, 45")subplot(2,2,4)imshow(ImClSq7)title("Closing Line 5, 90")%% Applying erosion twiceImErSq3_2 = imerode(ImErSq3,SESQ3);figure(5)subplot(1,3,1)imshow(Im)title("Original Image")subplot(1,3,2)imshow(ImErSq3)title("Erosion Line 5, 0")subplot(1,3,3)imshow(ImErSq3)title("Erosion Line 5, 0 x2")%% Applying dilation twiceImDiSq3_2 = imdilate(ImDiSq3,SESQ3);figure(6)subplot(1,3,1)imshow(Im)title("Original Image")subplot(1,3,2)imshow(ImDiSq3)title("Dilation Line 5, 0")subplot(1,3,3)imshow(ImDiSq3_2)title("Dilation Line 5, 0 x2")%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Add salt and pepper noiseImAddNoise = imnoise(Im, "salt & pepper",0.02);% Apply erosion using Line 5, 0, 45, 90% Erosion Line 5, 0ImErSq3Noise = imerode(ImAddNoise,SESQ3);% Erosion Line 5, 45ImErSq5Noise = imerode(ImAddNoise,SESQ5);% Erosion SLine 5, 90ImErSq7Noise = imerode(ImAddNoise,SESQ7);% Display the results for Erosion Line 5, 0, 45, 90figure(7)subplot(2,2,1)imshow(ImAddNoise)title("Noisy Image")subplot(2,2,2)imshow(ImErSq3Noise)title("Erosion Line 5, 0")subplot(2,2,3)imshow(ImErSq5Noise)title("Erosion Line 5, 45")subplot(2,2,4)imshow(ImErSq7Noise)title("Erosion Line 5, 90")% Apply dilation using Line 5, 0, 45, 90% Dilation Line 5, 0ImDiSq3Noise = imdilate(ImAddNoise,SESQ3);% Dilation Line 5, 45ImDiSq5Noise = imdilate(ImAddNoise,SESQ5);% Dilation Line 5, 90ImDiSq7Noise = imdilate(ImAddNoise,SESQ7);% Display the results for Dilation Line 5, 0, 45, 90figure(8)subplot(2,2,1)imshow(ImAddNoise)title("Noisy Image")subplot(2,2,2)imshow(ImDiSq3Noise)title("Dilation Line 5, 0")subplot(2,2,3)imshow(ImDiSq5Noise)title("Dilation Line 5, 45")subplot(2,2,4)imshow(ImDiSq7Noise)title("Dilation Line 5, 90")% Apply opening using Line 5, 0, 45, 90% Opening Line 5, 0ImOpSq3Noise = imopen(ImAddNoise,SESQ3);% Opening Line 5, 45ImOpSq5Noise = imopen(ImAddNoise,SESQ5);% Opening Line 5, 90ImOpSq7Noise = imopen(ImAddNoise,SESQ7);% Display the results for opening Line 5, 0, 45, 90figure(9)subplot(2,2,1)imshow(ImAddNoise)title("Noisy Image")subplot(2,2,2)imshow(ImOpSq3Noise)title("Opening Line 5, 0")subplot(2,2,3)imshow(ImOpSq5Noise)title("Opening Line 5, 45")subplot(2,2,4)imshow(ImOpSq7Noise)title("Opening Line 5, 90")% Apply closing using Line 5, 0, 45, 90% Closing Line 5, 0ImClSq3Noise = imclose(ImAddNoise,SESQ3);% Closing Line 5, 45ImClSq5Noise = imclose(ImAddNoise,SESQ5);% Closing Line 5, 90ImClSq7Noise = imclose(ImAddNoise,SESQ7);% Display the results for Closing Line 5, 0, 45, 90figure(10)subplot(2,2,1)imshow(ImAddNoise)title("Noisy Image")subplot(2,2,2)imshow(ImClSq3Noise)title("Closing Line 5, 0")subplot(2,2,3)imshow(ImClSq5Noise)title("Closing Line 5, 45")subplot(2,2,4)imshow(ImClSq7Noise)title("Closing Line 5, 90")%% Applying erosion twiceImErSq3_2Noise = imerode(ImErSq3Noise,SESQ3);figure(11)subplot(1,3,1)imshow(ImAddNoise)title("Noisy Image")subplot(1,3,2)imshow(ImErSq3Noise)title("Erosion Line 5, 0")subplot(1,3,3)imshow(ImErSq3_2Noise)title("Erosion Line 5, 0 x2")%% Applying dilation twiceImDiSq3_2Noise = imdilate(ImDiSq3Noise,SESQ3);figure(12)subplot(1,3,1)imshow(ImAddNoise)title("Noisy Image")subplot(1,3,2)imshow(ImDiSq3Noise)title("Dilation Line 5, 0")subplot(1,3,3)imshow(ImDiSq3_2Noise)title("Dilation Line 5, 0 x2")%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Getting External gradient, Internal gradient and Gradient image% External gradient = Image dilated (with 3x3 Disk) - Image originalExtGradientIm = ImDiSq3 - Im;% Internal gradien = Image original - Image eroded (with 3x3 Disk)IntGradientIm = Im - ImErSq3;GradientImage = ExtGradientIm - IntGradientIm;% Display result of gradientsfigure(13)subplot(2,2,1)imshow(Im)title("Original Image")subplot(2,2,2)imshow(ExtGradientIm)title("External Gradient Image")subplot(2,2,3)imshow(IntGradientIm)title("Internal Gradient Image")subplot(2,2,4)imshow(GradientImage)title("Gradient Image")