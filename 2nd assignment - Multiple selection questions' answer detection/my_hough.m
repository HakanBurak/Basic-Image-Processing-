function [H] = my_hough(input_img)
    x = input_img;
    w = size(x,1);
    h = size(x,2);
    r = 40;
%     if w>h
%        r_max = round(h/2);
%     else
%        r_max = round(w/2); 
%     end
    r_max = 45;
    H=zeros(w+r_max,h+r_max);
    for i=1:w
        for j= 1:h
            if x(i,j)> 0
                for theta =1:360
                    %r = round(i*cosd(theta)+j*sind(theta));
                    ex = round(r * sind(theta));
                    a = i - round(r * sind(theta));
                    b = j - round(r * cosd(theta));
                    %r = sqrt((i-a)^2+(j-b)^2);
                    if (0 <a)&& (0<b)
                       H(a,b) =1+H(a,b);
                    end
                end
            end
        end
    end

    %H = ()