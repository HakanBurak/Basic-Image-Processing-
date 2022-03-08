function output_img = stretch_lin(input_img)
      x = im2double(input_img);
      y=zeros(512);
      m= max(x,[],'all');
      z= min(x,[],'all');

       for i = 1:512
         for j = 1:512
                y(i,j) = (255/(m-z))* (x(i,j)-z);
         end
       end
       output_img = uint8(y);
end

