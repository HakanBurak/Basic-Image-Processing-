function pine = find_the_pine(I)
   sizeofpine = size(I);
T=rgb2hsv(I);
huemin = 0.0;
huetop = 0.16;
th_saturation = 0.05;
th_value = 0.15;
hue = T(:,:,1); % Red channel
saturation = T(:,:,2); % Green channel
value = T(:,:,3);% Blue channel

pine = (huetop>hue)>huemin & saturation>th_saturation & value>th_value;
end