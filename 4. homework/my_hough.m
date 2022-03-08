function [H] = my_hough(input_img)
    x = input_img;
    w = size(x,1);
    h = size(x,2);
    r_max = round(sqrt(h^2+w^2));
    H=zeros(2*r_max+1,180);
    for i=1:w
        for j= 1:h
            if x(i,j)> 0
                for theta =1:180
                    r = round(i*cosd(theta)+j*sind(theta));
                    if ((-r_max) <r)&& (r<r_max)
                        H(r+r_max+1,theta) = 1+H(r+r_max+1,theta);
                    end
                end
            end
        end
    end
    %H = ()
    
    %for 
end
