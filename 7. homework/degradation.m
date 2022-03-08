function [y, h, n] = degradation(x)
    %putting given parameters to get h
    len =42;
    theta =30;
    h = fspecial('motion',len,theta);
    sizeofimg = size(x);
    %created n with the same size of image(noise) according to variance
    n = randn(sizeofimg) * sqrt(0.001);
    filteredimg = imfilter(x,h,'replicate','same','conv');
    %we filtered the img(conv side) and after that we added noise to get y
    y = filteredimg + n;
    
end
