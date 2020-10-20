#for i = 1:9
#  if i==5;
#    disp("We found 5")
#  else
#    disp(i)
#  endif
#endfor

#for i = 1:10
#  for j = 1:10
#     Test = i*j;
#    disp(Test)
#  endfor
#  disp(' ')
#endfor

clear all

matrix = zeros(4,4);
increment = 9;

for i = 1:4
  for j = 1:4  
    matrix(i,j) = increment;
    increment = increment-1;
    
    if(increment < 0)
    matrix(i,j) = 0;
  endif
  
  endfor
endfor
disp(matrix)