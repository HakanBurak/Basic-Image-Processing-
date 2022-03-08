function [TH] = threshold(IMG, level)
    row = size(IMG,1);
    column = size(IMG,2);
    for i = 1:row                %iterate over each row
        for j = 1:column                %iterate over each column
            if level > IMG(i,j)
                IMG(i,j) = 0;
            else
                IMG(i,j) = 255;
            end
        end
    end
    TH = IMG
    
            
            
        
        
        
        
end