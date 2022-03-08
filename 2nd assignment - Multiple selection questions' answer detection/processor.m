function [TH] = processor(Current_Image,verbose)
%[height,width] = size(Current_Image);

Current_Image_Gray = rgb2gray(Current_Image);
%imshow(Current_Image_Gray);

%First I tried strech with log strech however built-in matlab strech
%worked better due to  sat values.


%strecth  with log algorithm which we used in exercise
%c =32;
%Streched_Current_Img = stretch_log(Current_Image_Gray, c);

J = imadjust(Current_Image_Gray,stretchlim(Current_Image_Gray),[]);

%compared the 2 strech method by hist_vector in
%unused_but_tried_functions(calc_hist_vector)
%hist_vector = calc_hist_vector(Streched_Current_Img);
%hist_vector1 = calc_hist_vector(J);

%edge inding with built-in matlab command
edge_finded_img = edge(J,'Canny',0.12);
%imshow(edge_finded_img);

%taking the fft of image to align our image with  using fft line in the center.
Fourier_transformed_img = fft2(edge_finded_img);
%Finding magnitude val of fourier
[~, M] = fourier_parts(Fourier_transformed_img);
%As you showed in the exercise I used log transform in order to
%separate values better
L = log(M + 0.01);
%find the locations of max of eevry column store them in array l
[~, l] = max(L);
%find the locations of max of max of the matrix in order to find
%maximum values' row and column number
[~,maxval_ind] = max(L(:));
[max_row,max_col]=ind2sub(size(L),maxval_ind);
%imagesc(L);
%[R, T] = non_max_sup(M, 2, 9);

x1 = max_row - 10;
x2 = max_row + 10;

y1 = l(max_col - 10);
y2 = l(max_col + 10);
%finding the slope
slope=((y2-y1)./(x2-x1));
%rotation way differ regarding to slope which I used i function below
if y1 < y2
    angle_of_line = atand(slope);
    angle =  angle_of_line-90;
else
    angle_of_line = atand(slope);
    angle =  90+angle_of_line;
end

%after finding the angle we have to rotate our images according to needed degree.
Corrected_Image=imrotate(edge_finded_img,angle);
Corrected_Image_Gray  = imrotate(Current_Image_Gray,angle);
Corrected_Image_Orginal  = imrotate(Current_Image,angle);

if verbose == true
    figure(1)
    subplot(1,2,1);
    imshow(Current_Image);
    title('input image');
    
    subplot(1,2,2);
    imshow(Corrected_Image);
    title('rotated, binarized, “edge” image');
end
% Threshold values
non_max_sup__k =  8;
non_max_sup__p = 5;
% Hough transform on rotated edge picture
H = my_hough(Corrected_Image);
%
%find the rows and columns of max valued places on hough space
%which is center of circles
[row_of_circles, column_of_circles] = non_max_sup(H, non_max_sup__k, non_max_sup__p);
[row_of_circles,I] = sort(row_of_circles);
column_of_circles = column_of_circles(I);
%Rearranged them according to their places in matricel form
for k=2:8
    %if they  are not  different then 30 then they must be in same
    %row
    if (row_of_circles(k)+15>row_of_circles(k-1)) && ((row_of_circles(k)<row_of_circles(k-1)+15))
        %if they  are not  different then 30 then they must be in same
        %column(we don't want that) and the previous one should be differant to enter
        %if part
        if (~(column_of_circles(k)+15>column_of_circles(k-1)) && ((column_of_circles(k)<column_of_circles(k-1)+15)))&&(column_of_circles(k)<column_of_circles(k-1))
            temp1 = column_of_circles(k-1);
            column_of_circles(k-1)=column_of_circles(k);
            column_of_circles(k)=temp1;
            
            temp2 = row_of_circles(k-1);
            row_of_circles(k-1)=row_of_circles(k);
            row_of_circles(k)=temp2;
        end
    end
end

% imshow(Corrected_Image_Orjinal);
%title('Detected circles');
%hold on;
% radius of our circles which  is given
r =40;
th = 0:pi/50:2*pi;
A = {};
%cropping size  of window of circle
marg = 50;
%for every circle in the picture draw the circle
if verbose == true
    figure(2)
    subplot(1,2,2);
    imagesc(H);
    title('Hough Space');
end
if verbose == true  

    subplot(1,2,1);
    imshow(Corrected_Image_Orginal);
    hold on
end
for number_of_circles = 1:length(row_of_circles)
    xunit = r * cos(th) + column_of_circles(number_of_circles);
    yunit = r * sin(th) + row_of_circles(number_of_circles);
    if verbose == true
        h = plot(xunit, yunit,'LineWidth',5);
    end
    
    %
    %
    %store the circle picture inside of cell  of A
    x_boundryof_circle = (row_of_circles(number_of_circles)-marg:row_of_circles(number_of_circles)+marg);
    y_boundryof_circle = (column_of_circles(number_of_circles)-marg:column_of_circles(number_of_circles)+marg);
    A{number_of_circles} =  Corrected_Image_Gray(x_boundryof_circle,y_boundryof_circle);
    % imshow(Corrected_Image_Gray(x_boundryof_circle,y_boundryof_circle));
end

B ={};
% I chose to use interval(area) approach in order to figure out if
% circle is marked or not
for number = 1:8
    %initilization of area and restarting every loop
    area = 0;
    img = A{number};
    %in order find area muuch smoother area I thresholded the image
    img1 = threshold(img,220);
    for row_of_img  = 1:size(img,1)
        for col_of_img  = 1:size(img,2)
            if img1(row_of_img,col_of_img)==255
                area  = area+1;
                
            end
        end
    end
    % Stored values in the cell B in order to get the image and area
    % value same time
    B{number} = {img;area};
end

val1 = [];
%to decide is it a true or  false area comes in play  here.

for idk = 1:8
    
    image_and_area = B{1,idk} ;
    %we select our image and croos_area in separate forms
    image= cell2mat(image_and_area(1));
    cross_area = image_and_area{2};
    if verbose == true
        figure(3)
        subplot(4, 2, idk);
        imshow(image);
    end
    %it must be cross if it is a scribble we must say it is a false
    %due to lack of eraser thats why we have (2500>cross_area)
    if (cross_area >  750) && (2500>cross_area)
        val1(idk) = 1;
        if verbose == true
            title('True');
        end
    else
        val1(idk)  =  0;
        if verbose == true
            title('False');
        end
    end     
end

%reshape the values  in order to se in  main code.
TH = reshape(val1,2,4)';

end
    
            
            
        
        
        
