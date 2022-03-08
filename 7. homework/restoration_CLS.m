function [x_tilde] = restoration_CLS(y, h, alpha, c)
    %chaning to frequency domain to start calculating
    Y = fft2(y);
    sizeofmatrix = size(y);
    %desired size of conversion is the input size of y, so we converted
    %with the size of y on H and C parameters.
    H = psf2otf(h,sizeofmatrix);
    C = psf2otf(c,sizeofmatrix);
    %Applying the formula
    R = conj(H)./(abs(H).^2+alpha.*abs(C).^2);
    %restoration from frequency domain to spatial domain.
    x_tilde = ifft2(R.*Y);
    
    
end
