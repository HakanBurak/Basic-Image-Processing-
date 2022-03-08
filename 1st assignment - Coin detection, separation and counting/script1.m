coloredimg =imread('input/a01_DMWBL1 .jpg');
I = rgb2gray(coloredimg);
stretch_img = stretch_log(I, 16);
%BW = imbinarize(grayimg);
G2 = threshold(stretch_img,120);

            
huemin = 0.40;
huetop = 0.60;
th_saturation = 0.05;
th_value = 0.5;

figure(1);
subplot(131); imshow(coloredimg); title('Orginal image');
subplot(122); imshow(G2); title('Thresholded binary image');
K = fspecial('disk',70 ); % horizontal Prewitt 1st order derivative
K = K';
G3 = double(G2);
%outputimg = myconv(G2, K);
I_c_ref = conv2(G3, K, 'same');
%figure(2)
%imagesc(outputimg);
%colormap(gca,'jet'); colorbar;
%axis equal off;
figure(2)
imagesc(I_c_ref);
colormap(gca,'jet'); colorbar;
axis equal off;

title({'Output of conv2'});
a = coloredimg(1:300, 1:300,:);
n=1;
s=1;
u=1;


value2 =[];
value3 =[];
value4 =[];
for i = 1:1500
   for j = 1:2000
      if I_c_ref(i,j) > 200
        a= coloredimg(i-124:i+175,j-149:j+150,:);
        b=I_c_ref(i-149:i+150,j-149:j+150);
        I_c_ref(i-124:i+175,j-149:j+150)=0;
        
        T=rgb2hsv(a);
        hue = T(:,:,1); % Red channel
        saturation = T(:,:,2); % Green channel
        value = T(:,:,3);% Blue channel
        coin = double((huetop>hue)>huemin&value>th_value);
        z=[];
        q=1;
        l=0;       
        for t = 1:300
            for y =1:300
                if coin(t,y) == 1
                    l=l+1;
                    
                end
               
                
            end
        end
        z(q)= l;
        q=q+1;
        if l>18900
            figure(4)
            subplot(4,3,u); imshow(a);
            value1 = howmuch(a);
            value4=[value4;value1];
            if value1 == 2|| value1 == 51
                if value1 == 51
                    value1=5;
                end
                value2= [value2;value1];
            else
                value3=[value3;value1];
            end            
            if value4(u) == 2|| value4(u) == 51
                title(['cents of:', num2str(value2(s))]);
                s=s+1;
                u=u+1;
            else
                title([' forints of:',num2str(value3(u-s+1))]);
                u=u+1;
            end
        end        
        if l>18900
            figure(3)
            subplot(4,4,n); imshow(a);title('Coin')
            n=n+1;
        else
            subplot(4,4,n); imshow(a);
            title('NOT COIN')
            n= n+1;
        end

    
      end
   
   end
end
forints= sum(value3);
cents= sum(value2);
X = [' Total of  ',num2str(forints),'HUF and ',num2str(cents),'cents'];
disp(X)
%disp(forints,cents);
%%look up table




%%%%subplot(131); imshow(outputimg); title('Orginal image');
%%subplot(122); imshow(I_c_ref); title('Thresholded binary image');



