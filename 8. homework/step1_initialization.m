function [LUT, M] = step1_initialization(S, k)
    %getting the values of dimensions
    m = size(S,1);
    n = size(S,2);
    %defining LUT and M 
    LUT = zeros(1,m);
    M = zeros(k,n);
    %rounding steps to lower bound
    step = floor(m/k);      
    temp1 = 1;
    temp2 = 1;
    %so do this while we need kernels from S
    while k>0
        %equalize
        M(temp1,:) = S(temp2,:);
        %increment row counter
        temp1 = temp1 + 1;
        %increment on S plane
        temp2 = temp2 +step;
        k = k-1;
    end
        
end
