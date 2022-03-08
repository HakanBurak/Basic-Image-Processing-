function ClassMap = recognition_phase(I, MODEL)
    %gegtting the size of img
    size_of_img = size(I);
    %initilazation
    ClassMap = zeros(size_of_img);
    N = 1/(15*15) * ones(15);
    %rows
    w = size(I,1);
    %columns
    height = size(I,2);
    %initilazation
    BB =zeros(w,height,9);
    %class number is hidden inside MODEL which is nummber of rows
    class_number = size(MODEL,1); 
    %initilazation
    sum_abs_diff = zeros(1,class_number);
    for k = 1:9
        h = laws_kernel(k);
        %doing first convolution
        B1 = conv2(I,h,'same');
        %doing second convolution
        B2 =conv2((B1.^2),N,'same');
        %saving every value into 3rd dimension
        BB(:, :, k) = B2;
    end    
    for x =1:w
        for y = 1:height
            for n= 1:class_number
                temp1 = BB(x,y,:);
                temp2 = MODEL(n,:);
                sum_abs_diff(n) = sum(abs(temp1(:) - temp2(:)),'all');
            end
            %indices are hidden in second variable
            [val,ind] = min(sum_abs_diff);
            %sz=size(sum_abs_diff);
            %result = find(sum_abs_diff==min(val));
        	%class = ind2sub(sz,result);
            ClassMap(x,y) = ind;
        end
    end
   
    
                
    
        
end
