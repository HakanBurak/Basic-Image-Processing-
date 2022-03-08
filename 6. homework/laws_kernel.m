function H = laws_kernel(k)
    if (1<=k) &&  (k <= 9)
        L = 1/6 * [1; 2; 1];
        E = 1/2 * [1; 0; -1];
        S = 1/2 * [1; -2; 1];
        %for 3 part of L
        H = zeros(3,3);
        if k == 1
        H(:,:) = L*(L.');
        elseif k == 2
        H(:,:) = L*(E.');
        elseif k == 3
        H(:,:) = L*(S.');        
        %for 3 part of E
        elseif k == 4
        H(:,:) = E*(L.');
        elseif k == 5
        H(:,:) = E*(E.');
        elseif k == 6
        H(:,:) = E*(S.');       
        %for 3 part of S
        elseif k == 7
        H(:,:) = S*(L.');
        elseif k == 8
        H(:,:) = S*(E.');
        elseif k == 9
        H(:,:) = S*(S.');
        end
        
    else
        error('You entered k without in range');
    end  
end
