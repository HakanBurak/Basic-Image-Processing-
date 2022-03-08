clear; close all;
coloredimg = imread('input/AlfredoBorba_TuscanLandscape.jpg');
[VER,HOR,ROT] = flip_and_rotate(coloredimg);
subplot(1,3,1), imshow(VER), title('Vertically flipped')
subplot(1,3,2), imshow(HOR), title('Horizantally flipped')
subplot(1,3,3), imshow(ROT), title('45 degree rotated(clockwise)')
