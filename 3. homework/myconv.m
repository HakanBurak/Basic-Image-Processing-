function output_img = myconv(input_img, kernel)
    [xaxis,yaxis]=size(kernel);
    k1 = (xaxis-1)/2;
    k2 = (yaxis-1)/2;
    x = padarray(input_img,[k1 k2],0);
    rot_kernel  = rot90(kernel,2);
    a = zeros(105,158);
    for i = 1:105
         for j = 1:158
             for n =1:xaxis
                 for l =1:yaxis
                 xl(l) =x(i+n-1,j+l-1)* rot_kernel(n,l);
                 end
                 xn(n)=sum(xl);
             end
             a(i,j) = sum(xn);
         end
        
    end
    output_img = a;
end
