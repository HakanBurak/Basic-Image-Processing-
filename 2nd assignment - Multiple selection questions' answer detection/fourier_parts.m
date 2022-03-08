function [P, M] = fourier_parts(F)
    F_shifted = fftshift(F);
    P = angle(F_shifted);
    M = abs(F_shifted);
end
