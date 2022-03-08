close all;
clear;
clc;

I = imread('input/object.png');

F = detect_features(I, 'SURF');
k = 4;
min_met = 18000;

S = select_strongest_features(F, k, min_met);

assert(isa(F, 'SURFPoints'), 'Type of FeaturePointsOut is not correct.');
assert(length(S)<=k && min(S.Metric(:))>=min_met, 'Selection criteria are not satisfied.');

disp('If you see no MATLAB errors/warnings above this line then your select_strongest_features function seems to be OK.');
