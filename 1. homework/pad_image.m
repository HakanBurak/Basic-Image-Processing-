function [PAD] = pad_image(varargin)
    IMG = varargin{1};
    while size(IMG, 3) ~= 1
        warning('The image is not grayscale, converting now ....');
        IMG = rgb2gray(IMG);
    end
    
    if  ismember(1|20 ,varargin{2}) 
        border_size = varargin{2};
    else 
        border_size = 10;
    end
   
    X = zeros(border_size+402:border_size+608);
    X((border_size+402-201)/2:(border_size+402+201)/2, (border_size+608-304)/2:(border_size+608+304)/2) = IMG;
    PAD = X;
    
end