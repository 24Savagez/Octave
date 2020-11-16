function ToGrayScale = GrayScale(img,exp)
  
varsize = size(img);
newimg = double(img);

ToGrayScale = zeros(varsize(1),varsize(2));

for i = 1:varsize(1)
  for j = 1:varsize(2)
    switch(exp)
      case{'basic','Basic'}
        ToGrayScale(i,j) = (img(i,j,1)+img(i,j,2)+img(i,j,3))/3;

      case{'luminance','Luminance'}
        ToGrayScale(i,j) = (0.30*(img(i,j,1)))+(0.59*(img(i,j,2)))+(0.11*(img(i,j,3)));
       
      case{'desaturation','Desaturation'}
        ToGrayScale(i,j) = ((max(img(i,j,:)))+(min(img(i,j,:))))/2;
      otherwise
        warning('No conversion methods')
     
    end
  endfor
endfor

  ToGrayScale = uint16(round(ToGrayScale));

endfunction