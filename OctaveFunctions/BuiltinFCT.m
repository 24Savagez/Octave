% Load image packagepkg load image% Load an image using dialog box function uigetfile% uigetfile function to get the file path and file name[filename, filepath]=uigetfile({"*.png;*.jpg","Choose cameraman image to load"});% load the image using file path and file name put into squared bracked and separated with a comma ,I = imread([filepath,filename]);% Displaying images that have been loadedfigure(1)imshow(I)% Get the histogram of the imageh =imhist(I);% Get the threshold value using Otsu methodst = otsuthresh (h);J = im2bw (I,t);figure(2)imshow(J)title("Thresholded image")Holesfilled = imfill (J, "holes");figure(3)imshow(Holesfilled)% Find circle[centers, radii] = imfindcircles (I, [10 50]);% Show resultsfigure(4)imshow(I)viscircles (centers, radii)% Find connected pixelcc = regionprops (Holesfilled, 'all');centroids = cat(1, cc.Centroid);figure(5)imshow(I)hold onplot(centroids(:,1), centroids(:,2), 'b*')hold offboundingbox = bwboundaries(Holesfilled);figure(6)imshow(I)hold onfor k = 1:numel(boundingbox)  plot(boundingbox{k}(:, 2), boundingbox{k}(:, 1), 'r', 'linewidth', 2);endforhold offBWnobord = imclearborder(Holesfilled, 4);figure(7)imshow(BWnobord)