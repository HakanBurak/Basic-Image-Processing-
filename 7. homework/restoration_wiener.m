function [x_tilde] = restoration_wiener(y, h, n)
    %moving to frequency domain
    Y = fft2(y);
    sizeofmatrix = size(y);
    %desired size of conversion is the input size of y, so we converted
    %with the size of y
    H = psf2otf(h,sizeofmatrix);
    N = psf2otf(n,sizeofmatrix);
    %defining conjugates
    Y_star = conj(Y);
    N_star = conj(N);
    Pyy = Y.* Y_star;
    Pnn = N .* N_star;
    %Applying formula
    R = conj(H)./((abs(H).^2)+Pnn./Pyy);
    %restoration from frequency domain to spatial domain.
    x_tilde = ifft2(R.*Y);
end
