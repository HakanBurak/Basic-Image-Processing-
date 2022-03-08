function OUT = majority_voting(IN, w_dia)
    %getting the size IN
    size1 = size(IN);
    %initilazion
    OUT = zeros(size1);
    for x = 1:w_dia:size(IN,1)
        for y = 1:w_dia:size(IN,2)
           startx = x;
           endx = min(x+w_dia-1,size(IN,1));
           starty = y;
           endy = min(y+w_dia-1,size(IN,2));
           SelectedWindow = IN(startx:endx, starty:endy);
           MajorityValue = mode(SelectedWindow,'all');
           OUT(startx:endx, starty:endy) = MajorityValue;
        end
    end

        
end
