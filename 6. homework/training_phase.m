function MODEL = training_phase(T_cell)
    %we could havve used length but I wanted to use size instead
    N = size(T_cell,2);  
    %initilazition
    MODEL = zeros(N,9);
    for n = 1:N
        %conversion from cell to double
        T = cell2mat(T_cell(1,n));
        %rows = w
        w = size(T,1);
        %columns = height
        height = size(T,2);
        %initilazition
        temp_ar = [];     
        for k = 1:9
            %getting kernels
            h = laws_kernel(k); 
            %convolution
            A = conv2(T,h,'same');
            for x = 1:w
                for y = 1:height
                    %for addition we have to store values in temporary array 
                    temp = 1/(height*w) * A(x,y)^2;
                    temp_ar(x,y) = temp;
                end
            end
            %sum the values inside the temp_ar to meet the equtaion
            MODEL(n,k) = sum(temp_ar,'all');
        end
    end
end
