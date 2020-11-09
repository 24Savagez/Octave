function ToGrayScale = GrayScale(img)
  
varsize = size(img);
newimg = double(img);

desaturation = zeros(varsize(1),varsize(2));

for i = 1:varsize(1)
  for j = 1:varsize(2)
    desaturation(i,j) = ((max(img(i,j,:)))+(min(img(i,j,:))))/2;
  endfor
endfor

  ToGrayScale = uint16(round(desaturation));
  
endfunction