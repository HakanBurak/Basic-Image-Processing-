function num_value = howmuch(input_img)

huemin = 0.1;
huetop = 0.22;
th_saturation = 0.05;
th_value = 0.5;

x = length(input_img);
Y = im2double(rgb2gray(input_img));
%imshow(Y);
T=rgb2hsv(input_img);
hue = T(:,:,1); % Red channel
saturation = T(:,:,2); % Green channel
value = T(:,:,3);% Blue channel
coin = double((huetop>hue)>huemin&value>th_value);
E=Y-coin;
imshow(E);
area = 0;
for i=1:300
    for j= 1:300
        if E(i,j) <= 0 
            area = area +1;
        end
    end
end

%output_img = uint8(255 * mat2gray(E));            
%imshow(output_img);
radius = sqrt(area/pi);
d = 2*radius;
number =0;
if(145<d && d<160) 
    number = 2; 

elseif (165<d && d<172) 
    number = 5;
    %style ='forints';
elseif (160<d && d<165) 
    number = 51;
    %style ='cents';    

elseif (186<d && d<197) 
    number = 10 ; 

elseif(200<d&& d<210) 
    number = 20; 


elseif (225<d && d<231) 
    number = 50; 

elseif (175<d && d<190) 
    number = 100; 

elseif (210<d&& d<225) 
    number = 200; 
else
end
num_value = number;
end

