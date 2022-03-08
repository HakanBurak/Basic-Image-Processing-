function [r_vect, t_vect] = non_max_sup(A, k, p)

r_vect=[];

t_vect=[];

while k > 0
[~,ind] = max(A(:));
[r,c] = ind2sub(size(A),ind);
r_vect=[r_vect,r];
t_vect=[t_vect,c];
x_1=max(1,r-p);

x_2=min(size(A,1),r+p);

y_1=max(1,c-p);

y_2=min(size(A,2),c+p);

A(x_1:x_2,y_1:y_2)=0;

k=k-1;

end

end