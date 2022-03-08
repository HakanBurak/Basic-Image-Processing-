close all;
clear; clc;

M = [255.0000         0  255.0000         0  255.0000  360.6245         0  255.0000;
  360.6245  255.0000         0         0  255.0000         0  360.6245  360.6245;
         0  360.6245  255.0000  255.0000         0  255.0000  255.0000  360.6245;
         0         0         0         0  360.6245         0  255.0000  255.0000;
  255.0000  360.6245  255.0000  255.0000         0  255.0000  255.0000  255.0000;
         0  255.0000  255.0000  255.0000  360.6245  360.6245         0         0;
  255.0000  255.0000         0         0  255.0000  255.0000  255.0000  255.0000;
  360.6245  255.0000  360.6245  360.6245         0         0         0  255.0000;
         0  255.0000         0  360.6245  360.6245  255.0000  255.0000  255.0000;
  360.6245         0         0         0  255.0000  360.6245         0         0];

P = [90   NaN    90   NaN    90    45   NaN     0;
   -45    90   NaN   NaN     0   NaN    45   -45;
   NaN   -45     0    90   NaN   -90     0    45;
   NaN   NaN   NaN   NaN   -45   NaN     0   -90;
   -90    45     0     0   NaN     0   -90   -90;
   NaN     0     0    90    45   -45   NaN   NaN;
    90     0   NaN   NaN   -90    90     0    90;
    45   -90    45    45   NaN   NaN   NaN     0;
   NaN     0   NaN    45    45   -90     0   -90;
   -45   NaN   NaN   NaN    90    45   NaN   NaN];

H = pmHOG_binner(P, M);

assert(isequal(size(H), [1, 9]), 'Incorrect size of histogram-vector (H)');

l = [2, 4, 6, 8, 9];
assert(sum(H(l)) == 0 && (sum(H(1:2:7))-12251)<2, 'The calculated histogram-vector maybe incorrect');

M2 = round(rand(8, 10)*100);
P2 = zeros(size(M2));
P2(3, 3:5) = -11:1:-9;
P2(4, 4:6) = 9:11;
P2(5, 5:7) = 29:31;
H2 = pmHOG_binner(P2, M2);
assert(isequal(size(H2), [1, 9]), 'Incorrect size of histogram-vector (H)');
assert(sum(H2([1:3, 8:9]))==0 && H2(4)==M2(19) && ...
    H2(5)==sum(M2(:))-sum(M2([19, 36, 37, 44, 45, 53])) && ...
    H2(6)==sum(M2([36, 37, 44])) && H2(7)==sum(M2([45, 53])), ...
    'The calculated histogram-vector maybe incorrect, please check your bin-boundaries');

fprintf('Elementary check of your function pmHOG_binner has passed\n');
