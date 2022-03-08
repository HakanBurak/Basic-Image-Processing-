function B = random_dither(A)
  r= rand(256); 
  Sumofnum= r+A;
  B= Sumofnum > 1;
  
end
