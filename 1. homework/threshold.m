function [TH] = threshold(IMG, level)
    while size(IMG, 3) ~= 1
        warning('The image is not grayscale, converting now ....');
        IMG = rgb2gray(IMG);
    end
    for i = 1:402                %iterate over each row
        for j = 1:608                %iterate over each column
            if level > IMG(i,j)
                IMG(i,j) = 0;
            else
                IMG(i,j) = 255;
            end
        end
    end
    TH = IMG
    
            
            
        
        
        
        
end