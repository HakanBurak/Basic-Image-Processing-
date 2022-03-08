close all;
clear;
clc;

I = imread('input/object.png');
assert(isequal(detect_features(I, 'Harris'),detectHarrisFeatures(I)), 'Output is not OK for the Harris feature.');
assert(isequal(detect_features(I, 'SURF'),detectSURFFeatures(I)), 'Output is not OK for the SURF feature.');
assert(isequal(detect_features(I, 'BRISK'), detectBRISKFeatures(I)), 'Output is not OK for the BRISK feature.');

disp('If you see no MATLAB errors/warnings above this line then your detect_features function seems to be OK.');
