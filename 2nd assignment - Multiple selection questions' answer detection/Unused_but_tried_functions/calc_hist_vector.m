function hist_vector = calc_hist_vector(input_img)
    hist_vector= zeros(1,256);
    
    for i = 1:size(input_img,1)
         for j = 1:size(input_img,2)
             for n =1:256
                if n-1 == input_img(i,j)
                 hist_vector(n)= hist_vector(n) +1;
                 
                end
             end
         end
    end
    
end
