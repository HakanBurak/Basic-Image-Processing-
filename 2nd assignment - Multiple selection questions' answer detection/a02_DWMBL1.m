close all;
clear;
clc;

verbose = false;
% Get a list of all files in the folder.
filePattern = fullfile('C:\','Users','hbkar','Documents','MATLAB','Basic Img Processing','2nd assignment','input','/');
ImageFiles = dir(append(filePattern, '*.jpg*'));
%initilize total question numbers
Q1 = zeros(1,2);
Q2 = zeros(1,2);
Q3 = zeros(1,2);
Q4 = zeros(1,2);
%for every image send image to processor
for epoch = 1:length(ImageFiles)
    Current_Image_name = ImageFiles(epoch).name;
    
    Current_Image = imread(append(filePattern,Current_Image_name));
    %take the 4x2 matrix form processor
    [TH] = processor(Current_Image,verbose);
    %add returned values to initilized matrices
    Q1(1,:) = TH(1,:) + Q1(1,:);
    Q2(1,:) = TH(2,:) + Q2(1,:);
    Q3(1,:) = TH(3,:) + Q3(1,:);
    Q4(1,:) = TH(4,:) + Q4(1,:);
    
    
end

y1 = sprintf('Procossed %s images',num2str(epoch));
X1 = sprintf('Q1: A=%s    B=%s',num2str(Q1(1,1)),num2str(Q1(1,2)));
X2 = sprintf('Q2: A=%s    B=%s',num2str(Q2(1,1)),num2str(Q2(1,2)));
X3 = sprintf('Q3: A=%s    B=%s',num2str(Q3(1,1)),num2str(Q3(1,2)));
X4 = sprintf('Q4: A=%s    B=%s',num2str(Q4(1,1)),num2str(Q4(1,2)));
disp(y1);
disp(X1);
disp(X2);
disp(X3);
disp(X4);
%Lower part is what I tried while  writing this code.

%       [height,width] = size(Current_Image);
%
%       Current_Image_Gray = rgb2gray(Current_Image);
%       %imshow(Current_Image_Gray);
%       %strecth
%       c =32;
%       Streched_Current_Img = stretch_log(Current_Image_Gray, c);
%       J = imadjust(Current_Image_Gray,stretchlim(Current_Image_Gray),[]);
%       hist_vector = calc_hist_vector(Streched_Current_Img);
%       hist_vector1 = calc_hist_vector(J);

%       figure(3);
%       subplot(2,2,1);
%              imshow(Current_Image_Gray);
%              title('Grayscale input');
%       subplot(2,2,2);
% %             imshow(Streched_Current_Img);
%             imshow(J);
%             title(' S Grayscale input');
%       subplot(2,2,3);
%             histogram(double(Current_Image_Gray(:)), 256, 'FaceColor', [0 0.4470 0.7410], 'EdgeColor', [0 0.4470 0.7410]);
%             title('Official histogram');
%             xlim([1,256]);
%             ylim([1,2000]);
%       subplot(2,2,4);
%             bar(hist_vector1);
%             title('Your histogram');
%             xlim([1,256]);
%             ylim([1,2000]);
%        edge_finded_img = edge(J,'Canny',0.12);
%        imshow(edge_finded_img);
%         Fourier_transformed_img = fft2(edge_finded_img);
%         [P, M] = fourier_parts(Fourier_transformed_img);
%         L = log(M + 0.01);
%         [~, l] = max(L);
%         [maxval,maxval_ind] = max(L(:));
%         [max_row,max_col]=ind2sub(size(L),maxval_ind);
%         imagesc(L);
%         %[R, T] = non_max_sup(M, 2, 9);
%         %
%         length_of_l = length(l);
%
%         x1 = max_row - 10;
%         x2 = max_row + 10;
%         xaxis= (round(length_of_l/2) - 10):(round(length_of_l/2) + 10);
%
%         y1 = l(max_col - 10);
%         y2 = l(max_col + 10);
%
%         yaxis =l((round(length_of_l/2) - 10):(round(length_of_l/2) + 10));
%
%         slope=((y2-y1)./(x2-x1));
%         if y1 < y2
%             angle_of_line = atand(slope);
%             angle =  angle_of_line-90;
%         else
%             angle_of_line = atand(slope);
%             angle =  90+angle_of_line;
%         end
%
%
%         Corrected_Image=imrotate(edge_finded_img,angle);
%         Corrected_Image_Gray  = imrotate(Current_Image_Gray,angle);
%         Corrected_Image_Orjinal = imrotate(Current_Image,angle);
%







%         subplot(2, 2, 3);
%         h = imagesc(H); xlabel('\theta'); %ylabel('r');
%         d = round(sqrt(sum(size(I).^2)));
%         set(h, 'YData', [-d, d]);
%         ylim([-d, d]); ylabel('r');
%         title('Hough space and the selected maxima');
%         hold on;


%        non_max_sup__k =  2;
%        non_max_sup__p = 3;
%Thresholded_L = threshold(L,)
%        [H,T,R] = hough(edge_finded_img);
%        P  = houghpeaks(H,1,'threshold',ceil(0.9*max(H(:))));
%         x = T(P(:,2)); y = R(P(:,1));
%         plot(x,y,'s','color','white');
%         lines = houghlines(edge_finded_img,T,R,P,'FillGap',0.8*width,'MinLength',40);
% %         imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
% %         xlabel('\theta'), ylabel('\rho');
% %         axis on, axis normal, hold on;
% %         plot(T(P(:,2)),R(P(:,1)),'s','color','white');
%          figure;
%             if(lines.theta<0)
%             Corrected_Image=imrotate_white(Current_Image,(90-abs(lines.theta)));
%             else
%             Corrected_Image=(imrotate_white(Current_Image,lines.theta-90));
%             end
%         lines = houghlines(BW,T,R,P,'FillGap',0.8*c,'MinLength',40);
%         h = imagesc(H);
%         set(h, 'XData', [1,180]);
%         title('Hough space');
%         xlim([1,180]); xlabel('\theta');
%         %ylabel('r');
%         d = round(sqrt(sum(size(Current_Image).^2)));
%         set(h, 'YData', [-d, d]);
%         ylim([-d, d]); ylabel('r');
%         axis ij;
%        [R, T] = non_max_sup(H, non_max_sup__k, non_max_sup__p);
%Thresholded_L = threshold(L,7);
%imagesc(Thresholded_L);
%findpeaks(L);
%        slope=((row2-row1)/(col2-col1));
%averageSlope = slope;
%averageSlope=sum(slope)/length(slope);
%        [Pmax,row] = max(P);
%        angle = T(P(row(1,1),2));
% %        if  P(:,2) < -45
% %            angle = 90+angle;
% %        end
%        imshow(imrotate(Current_Image,(angle)));


