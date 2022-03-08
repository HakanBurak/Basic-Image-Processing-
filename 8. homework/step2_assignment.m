function LUT = step2_assignment(S, k, LUT, M)
%initilazation of the variable m and distance
 m = size(S,1);
 distance = zeros(1,k);
    for i =1:m
        for j = 1:k
            x_i = S(i,:);
            mu_j = M(j,:);
            %calculating the distance
            distance(j) = sum((x_i-mu_j).^2);
        end
        %getting min distance index
       [~,index]= min(distance);
       %writing this index into LUT
       LUT(i) = index;
    end
end
