close all;
clear;
clc;

% Get a list of all files in the folder.
filePattern = fullfile('C:\','Users','hbkar','Documents','MATLAB','Basic Img Processing','3rd assignment','input','/');
ImageFiles = dir(append(filePattern, '*.png*'));
Locations = dir(append(filePattern, '*.txt*'));

%for every image send image inside to process change epoch value by hand to get
%fast solutions
for epoch = 3:length(ImageFiles)
    %get the Image name and coordinates from array
    Current_Image_name = ImageFiles(epoch).name;
    Coordinates_name = Locations(epoch).name;
    %spesify what Image we are working on and matrix(coordinates)
    Current_Image = imread(append(filePattern,Current_Image_name));
    temp = readmatrix(append(filePattern,Coordinates_name));
    %separate coordinates
    X_coordinates = temp(1,:);
    Y_coordinates = temp(2,:);
    %get max values to create SPF matrix
    X_limit = max(X_coordinates);
    Y_limit = max(Y_coordinates);
    
    
    
    %create our kernel
    k = fspecial('gaussian',9,1);
    %check how much padding needed(summed up for both sides)
    [X_padding_by_kernel,Y_padding_by_kernel] = size(k);
    PSF = zeros(Y_limit,X_limit);
    %since coordinate can be 0 and our matrix starts from 1 add one more
    %padding
    PSF = padarray(PSF,[floor(X_padding_by_kernel/2),floor(Y_padding_by_kernel/2)],'both');
    PSF = padarray(PSF, [1 1], 'post');
    %PSF_orginal= zeros(size(PSF));
    
    
    X_shifted = X_coordinates + floor(X_padding_by_kernel/2);
    Y_shifted = Y_coordinates + floor(Y_padding_by_kernel/2);
    
    for i = 1:length(X_coordinates)
        %added 1 because of coordinate can be 0
        X_lower_boundry=(X_shifted(i)-floor(X_padding_by_kernel/2))+1;
        X_upper_boundry=(X_shifted(i)+floor(X_padding_by_kernel/2))+1;
        Y_lower_boundry=(Y_shifted(i)-floor(Y_padding_by_kernel/2))+1;
        Y_upper_boundry=(Y_shifted(i)+floor(Y_padding_by_kernel/2))+1;
        
        PSF(Y_lower_boundry:Y_upper_boundry,X_lower_boundry:X_upper_boundry)=PSF(Y_lower_boundry:Y_upper_boundry,X_lower_boundry:X_upper_boundry)+k(:,:);
    end
    
    
    
    %     %initiliaze finished PSF
    PSF_completed= zeros(size(PSF));
    sum1 = sum(PSF,'all','omitnan');
    %normalize PSF
    PSF_completed = PSF/sum1;
    figure(1)
    subplot(1,2,1)
    %plotting path and PSF
    plot(X_coordinates, Y_coordinates)
    title('GPS/IMU data');
    subplot(1,2,2)
    imagesc(PSF_completed)
    title('Assumed PSF');
    colormap(gray)
    set(gca,'YDir','normal')
    colorbar
    
    
    %Current_Image = im2gray(Current_Image);
    %Iteration for lucydeconv
    iteration = 1;
    while iteration<50
        if iteration == 1
            New_restored_img = Current_Image;
        end
        %get the new value and again itarate through it until it reach 50th
        %iteration
        New_restored_img= reconstruction_Richardson_Lucy(Current_Image,New_restored_img,PSF_completed);
        iteration = iteration +1;
    end
    figure(2)
    subplot(1,2,1)
    imshow(Current_Image);
    title('Original(degraded) image');
    subplot(1,2,2)
    imshow(New_restored_img);
    title('Restored(R-L deconv.) image');
    
    desired_local_contrast =0.2;
    desired_mean_value = 0.5;
    Amax = 2;
    p = 0.2;
    %Doing wallis filtering
    
    Wallis_filtered_deconvolved_img= Wallis2(New_restored_img);
    
    %getting the size of Wallis_filtered image
    [row, column, ~] = size(Wallis_filtered_deconvolved_img);
    %plotting
    figure(3)
    subplot(1,2,1)
    imshow(New_restored_img);
    title('Restored(R-L deconv.) image');
    subplot(1,2,2)
    imshow(Wallis_filtered_deconvolved_img);
    title('Wallis-filtered deconvolved image');
    
    %initilization of values
    Law_kernelized_image_original = zeros(row, column);
    Law_kernelized_image = zeros(row, column);
    
    %tried but it was too hard for me...
    %[T_cell_red,T_cell_green,T_cell_blue,T_range] = getting_training_data(Wallis_filtered_deconvolved_img);
    
    
    for every_dim = 1:3
        %getting current channel from image
        current_image_layer = Wallis_filtered_deconvolved_img(:,:,every_dim);
        %getting T values for every featured region and every channel
        [T1,T2,T3]=region_selection(epoch,current_image_layer);
        %creating T_cell
        T_cell_current ={T1,T2,T3};
        %Law filtering as we did practice
        Law_kernelized_image_temp = Law_filter(current_image_layer,T_cell_current);
        %Law filtering as we did practice
        Law_kernelized_image_original = Law_kernelized_image_original + Law_kernelized_image_temp;
        
    end
    %round the values down
    Law_kernelized_image = floor(Law_kernelized_image_original /3);
    %plotting values
    figure(4);
    imagesc(Law_kernelized_image);
    title('Segmented terrain image');
end


%%%unused...
%for j= 1:size(PSF,1)
%   PSF_orginal(j,:) = PSF(size(PSF,1)+1-j,:);
%end
%%%%
%deconvlucy