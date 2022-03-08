clear; close all;
I = imread('input/AlfredoBorba_TuscanLandscape.jpg');
I = rgb2gray(I);
row =150;
for i = 1:608
intensity(i) = I(row,i);
end

subplot(2,1,1);
imshow(I);
line([0 608],[150 150],'Color','red')
subplot(2,1,2);
plot(1:608,intensity);
xlabel('column index')
ylabel('pixel intensity value')