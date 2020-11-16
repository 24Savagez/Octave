function NoiseRemoval = NoiseRemovals(img)
varsize = size(img);
imgz = double(img);
noiseRemoval = imgz;
  
for i = 1+1:varsize(1)-1;
  for j = 1+1:varsize(2)-1;
    noiseRemoval(i,j) =(imgz(i-1,j-1)+imgz(i,j-1)+imgz(i+1,j-1)...
                      +imgz(i-1,j)+imgz(i,j)+imgz(i+1,j)...
                      +imgz(i-1,j+1)+imgz(i,j+1)+imgz(i+1,j+1))/9;
  endfor
endfor
NoiseRemoval =  uint8(round(noiseRemoval)); 
endfunction
