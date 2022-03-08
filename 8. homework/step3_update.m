function M = step3_update(S, k, LUT, M)
    for j = 1:k
        %creating logical array to get classed value every turn without
        %changing LUT itself
        LUT_temp = LUT == j;
        x = S(LUT_temp,:); 
        %taking mean of the x values 
        mu_j = 1/size(x,1)*sum(x,1);
        %updating them inside M
        M(j,:) = mu_j;
    end
            
end
