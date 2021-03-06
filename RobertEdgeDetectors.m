function EdgeDetector = RobertEdgeDetectors(img)
varsize = size(img);
imgz = double(img);
Gx = zeros(varsize(1),varsize(2));
Gy = zeros(varsize(1),varsize(2));

for i = 1+1:varsize(1)-1;
  for j = 1+1:varsize(2)-1;
      Gx(i,j) = ((imgz(i-1,j-1))...
                +(imgz(i+1,j-1)*0)...
                +(imgz(i-1,j+1)*0)...
                +(imgz(i+1,j+1)*-1));
      
      Gy(i,j) = ((imgz(i-1,j-1)*0)...
                +(imgz(i+1,j-1))...
                +(imgz(i-1,j+1)*-1)...
                +(imgz(i+1,j+1)*0));
      
      G(i,j) = sqrt((Gx(i,j)^2)+(Gy(i,j)^2));
  endfor
endfor

EdgeDetector = uint16(round(G));

endfunction
