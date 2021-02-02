imagesc(theta, rho_samp, hough_accumulator);
title('Hough Accumulator');
xlabel('Theta (degree)');
ylabel('Rho (pixels)');
colormap('colormap');

% Load a binary matrix that only contains 1 line
Im = [0 1 1 0 0 0 0 0 0 0 0 0 0 0;...
      0 1 0 1 0 0 0 0 0 0 0 0 0 0;...
      0 1 0 0 1 0 0 0 0 0 0 0 0 0;...
      0 1 0 0 0 1 0 0 0 0 0 0 0 0;...
      0 1 0 0 0 0 1 0 0 0 0 0 0 0;...
      0 1 0 0 0 0 0 1 0 0 0 0 0 0;...
      0 1 0 0 0 0 0 0 1 0 0 0 0 0;...
      0 1 0 0 0 0 0 0 0 1 0 0 0 0;...
      0 1 0 0 0 0 0 0 0 0 1 0 0 0;...
      0 1 0 0 0 0 0 0 0 0 0 1 0 0];
      
%% set up variables for hough transform
% Get the angular sampling frequency (in degree)
theta_sample = 1;     
% Set the angle sampling
theta = (0:theta_sample:180);
%Get image size
[nbrow, nbcol] = size(Im);
% Get the row limit [0 to Sqrt(nbrow^2+nbcol^2)
rho_lim = sqrt(nbrow^2+nbcol^2);

% set the sampling of rho with a step of 1
rho_samp = (0:1:rho_lim*2);
% Check the length of theta 
thetas_length = length(theta);
% Check the size of rhos
rhos_length = length(rho_samp);
% Create the Hough accumulator
hough_accumulator = zeros(rhos_length, thetas_length);