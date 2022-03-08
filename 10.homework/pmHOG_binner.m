function H = pmHOG_binner(PHI, MAG)
    Histogram_vector = zeros(1,9);
    for i =1:size(Histogram_vector,2)
        max1 = 90;
        min1 = -90;
        increment = (max1-min1)/length(Histogram_vector);
        maxi = min1 + increment*i;
        mini = min1 + increment*(i-1);
        LOG_MASK = (PHI>= mini & PHI < maxi);
        MAG_values= zeros(size(LOG_MASK));
        MAG_values(LOG_MASK) = MAG(LOG_MASK);
        sum_of_val = sum(MAG_values,'all');
        Histogram_vector(1,i) = sum_of_val;
    end
    H = Histogram_vector;
end
