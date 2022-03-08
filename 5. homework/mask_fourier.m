function newF = mask_fourier(F, x, y, r)
   newF = fftshift(F);
   x= round(x);
   y= round(y);
   k = length(x); 
   while k >0

        x_1=max(1,y(k)-r);
        x_2=min(size(newF,1),y(k)+r);
        y_1=max(1,x(k)-r);
        y_2=min(size(newF,2),x(k)+r);
        newF(x_1:x_2,y_1:y_2)=0;
        k = k-1;
    end
   %F_shifted(x_1:x_2,y_1:y_2)=0;
   newF = ifftshift(newF);  
   
end
