function [T_cell_red,T_cell_green,T_cell_blue,T_range] = getting_training_data(I)
%initilazition for T's
T1 =zeros(51);
T2 =zeros(51);
T3 =zeros(51);
%getting the column and row values to create 
[Row,Column,~]= size(I);
%levels of thresholding 
level1 = 0.4;
level2 = 0.4;
level3 = 0.3;
%thresholding every layer of the image
[TH1] = threshold(I(:,:,1), level1);
[TH2] = threshold(I(:,:,2), level2);
[TH3] = threshold(I(:,:,3), level3);
%to stop if loop from checking the data again for if condition once it is
%found
stop1=0;
stop2=0;
stop3=0;
%creating kernel to check [70 70] if conditions satisfy
for i =36:(Row-35)
    for j = 36:(Column-35)
        range1= i-35:i+35;
        range2= j-35:j+35;
        %if there is a kernel all the thresholded values 0 this kernel is
        %forest
        if  stop1==0 && sum(TH1(range1,range2),'all')==0 && sum(TH2(range1,range2),'all')==0 && sum(TH1(range1,range2),'all')==0
            T1=I(range1,range2,:);
            T1_range = [range1;range2];
            %imagesc(T1);
            stop1 =1;
        end
        %if there is a kernel all the thresholded values of second(green) layer are 255 this kernel is
        %golf court
        if stop2==0 && sum(TH2(range1,range2),'all')== 4900*255
            T2=I(range1,range2,:);
            T2_range = [range1;range2];
            stop2=1;
            %imagesc(T1);
        end
        %if there is a kernel all the thresholded values of third(blue) layer are 255 this kernel is
        %water
        if stop3 ==0 && sum(TH3(range1,range2),'all')== 4900 *255
            T3=I(range1,range2,:);
            T3_range = [range1;range2];
            stop3=1;
            %imagesc(T3);
        end
    end
end
T_cell_red = {T1(:,:,1), T2(:,:,1), T3(:,:,1)};
T_cell_green ={T1(:,:,2), T2(:,:,2), T3(:,:,2)};
T_cell_blue ={T1(:,:,3), T2(:,:,3), T3(:,:,3)};
T_range = {T1_range, T2_range, T3_range};

end
% for dimension = 1:3
%     Wallis_filtered_deconvolved_img = I(:,:,dimension);
%     
%      
%     %%imagesc(TH);
%     
%     if dimension == 1
%         level = 0.4;
%         [TH] = threshold(Wallis_filtered_deconvolved_img, level);
%         for i =26:(Row-25)
%             for j = 26:(Column-25) 
%                 range1= i-25:i+25;
%                 range2= j-25:j+25;
%                 if  sum(TH(range1,range2),'all')== 2601 *255
%                     %T1=Wallis_filtered_deconvolved_img(range1,range2);
%                     T1_range = [range1;range2];
%                     imagesc(T1);
%                     break;
%                 end             
%             end
%             if T1>0
%                 break;
%             end
%         end
%     end
%     if dimension == 2
%         level = 0.4;
%         [TH] = threshold(Wallis_filtered_deconvolved_img, level);
%         for i =26:Row-25
%             for j = 26:Column-25
%                 range1= i-25:i+25;
%                 range2= j-25:j+25;
%                 if  sum(TH(range1,range2),'all')== 2601 *255
%                     %T2=Wallis_filtered_deconvolved_img(range1,range2);
%                     T2_range = [range1;range2];
%                     imagesc(T2);
%                     break;
%                 end
%             end
%             if T2>0
%                 break;
%             end
%         end
%     end
%     if dimension == 3
%         level = 0.2;
%         [TH] = threshold(Wallis_filtered_deconvolved_img, level);
%         for i =26:Row-25
%             for j = 26:Column-25
%                 range1= i-25:i+25;
%                 range2= j-25:j+25;
%                 if  sum(TH(range1,range2),'all')== 2601 *255
%                     %T3=Wallis_filtered_deconvolved_img(range1,range2);
%                     T3_range = [range1;range2];
%                     imagesc(T3);
%                     break;
%                 end
%             end
%             if T3>0
%                 break;
%             end
%         end
%     end
%     TH_index1 = [TH] == 255;
%     elseif  dimension == 2
%     TH_index2 = [TH] == 255;
%     elseif  dimension == 3
%     TH_index3 = [TH] == 255;
%     end

%     T1 =Wallis_filtered_deconvolved_img(TH_index1,:);
    
    %T2 =Wallis_filtered_deconvolved_img(301:600, 401:800);
   % T3 =Wallis_filtered_deconvolved_img(301:600, 401:800);
    
    
    %T_cell = {T1, T2, T3, T4};
   % MODEL = training_phase(T_cell);
    %GUESS = recognition_phase(I, MODEL);
   % VOTED = majority_voting(GUESS, 6);

