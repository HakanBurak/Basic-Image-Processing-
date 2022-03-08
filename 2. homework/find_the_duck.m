function duck = find_the_duck(I)
sizeofduck = size(I);
T=rgb2hsv(I);
huemin = 0.08;
huetop = 0.20;
th_saturation = 0.05;
th_value = 0.05;
hue = T(:,:,1); % Red channel
saturation = T(:,:,2); % Green channel
value = T(:,:,3);% Blue channel

duck = (huetop>hue)>huemin & saturation>th_saturation & value>th_value;

    

end