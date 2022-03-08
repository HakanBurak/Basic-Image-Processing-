function [r_vect, t_vect] = non_max_sup(A, k, p)
    r_vect=[];
    t_vect=[];
    while k >0
        [resultmain,ind] = max(A);
        [result,column] = max(resultmain);

        r = ind(column);
        theta= column;
        r_vect = [r_vect,r];
        t_vect = [t_vect,theta];
        x_1=max(1,r-p);
        x_2=min(size(A,1),r+p);
        y_1=max(1,theta-p);
        y_2=min(size(A,2),theta+p);
        A(x_1:x_2,y_1:y_2)=0;
        k = k-1;
    end
end


