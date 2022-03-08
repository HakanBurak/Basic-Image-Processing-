function norm_HOG = pmHOG_extractHOG(I)
    [rows,columns] = size(I);
    vertical_cells = rows/8;
    horizontal_cells = columns/8;
    norm_HOG = zeros(vertical_cells-1,horizontal_cells-1, 36);
    a=0;
    for i = 1:8:rows-8
        a=a+1;
        b= 0;
        for  j = 1:8:columns-8
            b=b+1;
            lower_boundry_x =(i);
            upper_boundry_x =(i+15);
            lower_boundry_y =(j);
            upper_boundry_y =(j+15);
            sub_matrix = I(lower_boundry_x:upper_boundry_x,lower_boundry_y:upper_boundry_y);
            feature_vector = [];
            
            for x =1:8:size(sub_matrix,1)
                for y = 1:8:size(sub_matrix,2)
                    cell_lower_boundry_x =(x);
                    cell_upper_boundry_x =(x+7);
                    cell_lower_boundry_y =(y);
                    cell_upper_boundry_y =(y+7);
                    cell_matrix = sub_matrix(cell_lower_boundry_x:cell_upper_boundry_x,cell_lower_boundry_y:cell_upper_boundry_y);
                    [PHI, MAG] = pmHOG_gradient(cell_matrix);
                    H = pmHOG_binner(PHI, MAG);
                    feature_vector = [feature_vector,H];
                end
            end
            feature_vector = feature_vector / sum(feature_vector);
            norm_HOG(a,b,:)= feature_vector;
        end
    end
    
end

