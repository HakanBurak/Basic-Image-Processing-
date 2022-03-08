clear; close all;
coloredimg = imread('input/AlfredoBorba_TuscanLandscape.jpg');
imshow(coloredimg);
title('Original photo');
if size(coloredimg, 3) == 3
    isColor = 1;
elseif size(coloredimg, 3) == 1
    isColor =0;
else 
    isColor =-1;
end;
grayimg = rgb2gray(coloredimg);
figure, imshow(grayimg);
title('RGB2Gray photo');
imwrite(grayimg, 'C:\Users\hbkar\Documents\MATLAB\output\AlfredoBorba_TuscanLandscape_GRAY.jpg');
