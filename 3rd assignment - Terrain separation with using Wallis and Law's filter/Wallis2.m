function New_restored_img = Wallis2(I_current)

for dimension = 1:3
    Part_of_image = I_current(:,:,dimension);
    Part_of_image=double(Part_of_image);   
    [row_number,column_number] = size(Part_of_image);   
    New_restored_img_temp=zeros(row_number,column_number);  
    % Initalizing local contrast and local average
    local_contrast=0;   
    local_avarage=0;
    % calculating N
    N = abs(row_number*column_number); 
    %Suggested variables
    P=0.2; 
    range=1;
    Desired_avarage = 0.5 * max(range);
    Desired_contrast= 0.2 * max (range); 
    Amax = 2; 
   
    %local avarage
    for row=1:row_number      
        for column=1:column_number     
            local_avarage=local_avarage+Part_of_image(row,column);            
        end        
    end    
    local_avarage = local_avarage/N;    
    
    %local contrast
    for row_c=1:row_number      
        for column_c=1:column_number           
            temp=(Part_of_image(row_c,column_c)-local_avarage).^2;         
            local_contrast=local_contrast+temp;           
        end    
    end   
    local_contrast= sqrt(local_contrast)/N;
    
    %just given formula applied here
    for current_row= 1:row_number      
        for current_column=1:column_number         
            New_restored_img_temp(current_row,current_column)= ((Part_of_image(current_row,current_column)-local_avarage) * ((Amax*Desired_contrast)/(Amax*local_contrast+Desired_contrast)) + (P*Desired_avarage+(1-P)*local_avarage));           
        end
        
    end
    %storing new image to dimensions
    New_restored_img(:,:,dimension) =  New_restored_img_temp;
end
end