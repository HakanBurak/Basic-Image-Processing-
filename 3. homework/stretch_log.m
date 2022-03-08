function output_img = stretch_log(input_img, c)
    input_img = im2double(input_img);
    w =size(input_img,1);
    h=size(input_img,2);
    y = zeros(w,h);
    for i = 1:w
        for j = 1:h
            a = input_img(i,j);
            y(i,j) = c* log((a+1));
        end
    end
    m= max(y,[],'all');
    z= min(y,[],'all');
    for i = 1:w
        for j = 1:h
            y(i,j) = (255/(m-z))* (y(i,j)-z);
        end
    end
    
    output_img = uint8(y);
end
