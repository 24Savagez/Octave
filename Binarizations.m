function Binarization = Binarizations(img,VThreshold)
varsize = size(img);
newimg = double(img);

binarizations = zeros(varsize(1),varsize(2));

for i = 1:varsize(1)
  for j = 1:varsize(2)
    
    if(newimg(i,j) < VThreshold)
      binarizations(i,j) = 0;
    else
      binarizations(i,j) = 1;
     endif
  endfor
endfor
  Binarization = binarizations;
endfunction
