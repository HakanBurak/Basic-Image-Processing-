function B = ordered_dither(I, D)
    szI=size(I);
    szD=size(D);
    rowmultip = szI(1,1)/szD(1,1);
    columnmultip = szI(1,2)/szD(1,2);
    threshold = repmat(D,rowmultip,columnmultip);
    B = I>threshold;
end
