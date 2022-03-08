function [TH] = threshold(IMG, level)
    end
    for i = 1:size(IMG,1)                %iterate over each row
        for j = 1:size(IMG,2)                 %iterate over each column
            if level > IMG(i,j)
                IMG(i,j) = 0;
            else
                IMG(i,j) = 255;
            end
        end
    end
    TH = IMG
    
            
            
        
        
        
        
end