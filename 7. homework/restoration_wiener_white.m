function [x_tilde] = restoration_wiener_white(y, h, var_n)
    %moving to frequency domain
    Y = fft2(y);
    sizeofmatrix = size(y);
    %desired size of conversion is the input size of y, so we converted
    %with the size of y
    H = psf2otf(h,sizeofmatrix);
    var_y  = var(y(:));
    %calculating to Noise signal power ratio
    NSPR = var_n/var_y;
    %Applying formula
    R = conj(H)./((abs(H).^2)+NSPR);
    %restoration from frequency domain to spatial domain.
    x_tilde = ifft2(R.*Y);
end
