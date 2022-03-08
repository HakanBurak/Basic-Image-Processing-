function [PHI, MAG] = pmHOG_gradient(I)   
    image = double(I);
    Hx = [-1 0 1];
    Hy= [-1;0;1];
    display(Hy);
    X = imfilter(image, Hx,'replicate','same');
    Y = imfilter(image, Hy,'replicate','same');
    MAG=sqrt(X.^2 + Y.^2);
    PHI=rad2deg(atan(Y./X));
end
