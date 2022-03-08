function [LUT, M] = mykmeans(S, k)
    %applying first step at the begining 
   [LUT, M] = step1_initialization(S, k);
   %creating constant variables
   iteration_number =1;
   th = 0.02;
   E =1;%arbitarary value to initilize the first while loop
   %while Error is greater then epsilon threshold and iteration number
   %smaller than 100 get in
   while((E>th && iteration_number <100))
       %assignment and update steps as it shown in previous examples
       LUT2 = step2_assignment(S, k, LUT, M);
       M2 = step3_update(S, k, LUT2, M);
       temp = zeros(1,k);
       for j=1:k
           mu_j = M(j,:);
           mu_j_new = M2(j,:);
           %storing the difference between new mu_J and old one sum them
           %up.
           temp(j) = sum((mu_j_new-mu_j).^2);
       end
        E = sum(temp);
        %updating values.
        LUT = LUT2;
        M = M2;
        
       iteration_number = iteration_number +1;
       
   end

       
end
