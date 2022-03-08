function y_edgetapered = blur_edge(y)
    %As we did before first we have to move to frequency domain.
    Y = fft2(y);
    h_size = 60;
    sigma = 10;
    h = fspecial('gaussian',h_size,sigma);
    sizeofmatrix = size(y);
    %desired size of conversion is the input size of y, so we converted
    %with the size of y
    H = psf2otf(h,sizeofmatrix);
    %To achieve swift transition we put on ones and apply it on our blurred
    %image
    %Otherwise we would not get any high frequency regions due to the
    %filter.
    blurred_img = ifft2(H.*Y);
    wm = ones(70,70);
    temp = padarray(wm,[1 1],0,'both');
    wm2 = imresize(temp, sizeofmatrix,'bilinear');
    y_edgetapered = wm2.* y +(1-wm2) .*blurred_img;
    
end
