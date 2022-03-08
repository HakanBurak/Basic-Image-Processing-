close all;
clear;
clc;

ObjectImage = imread('input/object.png');
SceneImage = imread('input/scene.png');

figure(1);
subplot(121); imshow(ObjectImage); title('Object');
subplot(122); imshow(SceneImage); title('Scene');
pause(0.1);

ObjectPoints = detect_features(ObjectImage, 'SURF');
ScenePoints  = detect_features(SceneImage,  'SURF');

figure(2);
subplot(121); imshow(ObjectImage); title('Object with all candidate points'); hold on; plot(ObjectPoints); hold off;
subplot(122); imshow(SceneImage); title('Scene with all candidate points'); hold on; plot(ScenePoints); hold off;
pause(0.1);

k = 150;
limit = 12000; %0.000001
ObjectPoints = select_strongest_features(ObjectPoints, k, limit);
ScenePoints  = select_strongest_features(ScenePoints,  k, limit);

figure(3);
subplot(121); imshow(ObjectImage); title('Object and the selected points only'); hold on; plot(ObjectPoints); hold off;
subplot(122); imshow(SceneImage); title('Scene and the selected points only'); hold on; plot(ScenePoints); hold off;
pause(0.1);

[ObjectFeatures, ObjectPoints] = extractFeatures(ObjectImage, ObjectPoints);
[SceneFeatures, ScenePoints]   = extractFeatures(SceneImage, ScenePoints);

indexPairs = matchFeatures(ObjectFeatures, SceneFeatures);

matchedObjectPoints = ObjectPoints(indexPairs(:, 1));
matchedScenePoints  = ScenePoints( indexPairs(:, 2));

figure(4);
showMatchedFeatures(ObjectImage, SceneImage, matchedObjectPoints, matchedScenePoints, 'montage');
title('Match points');

