% close all the windows and clear the memoryclose all, clear all% load the image processing package of Octavepkg load image%%Set up variables for hough transform%Get the angular sampling frequency (in radian)theta_sample = 0.1;Im = imread("test2.jpg");Im = im2bw(Im,(80/255));%Get image size[nbrow, nbcol] = size(Im);SESQ3=strel("square",3);ImErSq3 = imerode(Im,SESQ3);IntGradientIm = Im - ImErSq3;ImDiSq3 = imdilate(Im,SESQ3);ExtGradientIm = ImDiSq3 - Im;GradientImage = ExtGradientIm - IntGradientIm;figure(1)imshow(GradientImage)%Set the angle samplingtheta = (0:theta_sample:2*pi);%Check the length of thetathetas_length = length(theta);%Creat the hough accumulatorhough_accumulator = zeros(nbrow, nbcol);%Set rr = 17;%Go throught every pixel of the imagefor i = 1:nbrow  for j = 1:nbcol    if GradientImage(i, j) == 1      for theta_index = 1:thetas_length        th = theta(theta_index);                a = i - r * cos(th);        b = j - r * sin(th);                a_index = round(a);        b_index = round(b);                if a_index > 0 && b_index > 0 && a_index < nbrow && b_index < nbrow        %Increment the Hough accumulator at location         hough_accumulator(a_index, b_index) = ...          hough_accumulator(a_index, b_index)+1;        end      end
    end
  endend%Display the hough accumulator%%Show hough transformfigure(2)%Use imagesc function to display itimagesc(hough_accumulator);Maxvalue = max(max(hough_accumulator));[a,b] = find(hough_accumulator == Maxvalue);for x = 1:nbrow  for y = 1:nbcol    x = b + r*(cos(theta));    y = a + r*(sin(theta));  endendfigure(3)hold onimshow(Im)plot(x,y,"*g");hold off