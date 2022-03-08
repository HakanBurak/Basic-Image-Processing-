function output_img = stretch_log(input_img, c)
    x= im2double(input_img);
    for i = 1:1500
        for j = 1:2000
            a = x(i,j);
            y(i,j) = c* log((a+1));
        end
    end
    output_img = uint8(255 * mat2gray(y));
end
