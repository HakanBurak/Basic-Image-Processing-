function hist_vector = calc_hist_vector(input_img)
    hist_vector= zeros(1,256);
    for i = 1:1500
         for j = 1:2000
             for n =1:256
                if n-1 == input_img(i,j)
                 hist_vector(n)= hist_vector(n) +1;
                 
                end
             end
         end
    end
    
end
