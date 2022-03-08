function [score] = detectPedestrians(I, sample_HOG)
    H = pmHOG_extractHOG(I);
    temp = H .*sample_HOG;
    a= temp<0.01;
    temp1 = temp;
    temp1(a) = 0;
    score = sum(temp1,'all','omitnan');
end
