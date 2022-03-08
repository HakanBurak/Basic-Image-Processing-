function New_restored_img = reconstruction_Richardson_Lucy(Current_Image,reconstructed_Image_main, PSF)

        PSF1= rot90(PSF,2);
    for dim = 1:3%for each dimension
        Image = Current_Image(:,:,dim);% degraded_image 
        reconstructed_Image = reconstructed_Image_main(:,:,dim);% reconstructed Image
        %compared 2 results
        %PSF2 = PSF(end:-1:1,end:-1:1); % flipped PSF
        PSF2 = PSF1(end:-1:1,end:-1:1); % flipped PSF rotated
        %changing it to double 
        reconstructed_Image_d = im2double(reconstructed_Image);
        %frequency domain
        degraded_image_freq = fft2(Image);
        %changing it to double
        degraded_image_double = im2double(Image);
        reconstructed_Image_freq = fft2(reconstructed_Image);

        %getting the size and creating new restored image
        sizeofmatrix = size(Image);
        New_restored_img(:,:,dim) = zeros(sizeofmatrix);
        %freq domain
        OTF = psf2otf(PSF1,sizeofmatrix);
        OTF2 = psf2otf(PSF2,sizeofmatrix);
        %just formula
        R = ifft2(reconstructed_Image_freq.*OTF);    

        temp2 = fft2(degraded_image_double./R);

        temp4 = ifft2(temp2 .*OTF2);
        %wrtiting values to every dimension
        New_restored_img(:,:,dim) =reconstructed_Image_d .* temp4 ;
    end
end
%     UNUSED%      red1 = Image(:,:,1);
%      green1 = Image(:,:,2);
%      blue1 = Image(:,:,3);
%      
%      red2 = reconstructed_Image(:,:,1);
%      green2 = reconstructed_Image(:,:,2);
%      blue2 = reconstructed_Image(:,:,3);
%     red1 = Image(:,:,1);
%     green1 = Image(:,:,2);
%     blue1 = Image(:,:,3);
%     
%     red2 = reconstructed_Image(:,:,1);
%     green2 = reconstructed_Image(:,:,2);
%     blue2 = reconstructed_Image(:,:,3);
%     
%     sizeofmatrix = size(red1);
%     
%     PSF_HAT2 = PSF(end:-1:1,end:-1:1);
%     PSF_freq = psf2otf(PSF,sizeofmatrix);
%     PSF_HAT_freq = psf2otf(PSF_HAT2,sizeofmatrix);
%     i = 1;
%     while i <4
%         if i ==1
%             pic = red1;
%             pic2 = red2;
%         elseif i == 2
%             pic = green1;
%             pic2 = green2;
%         
%         elseif i == 3
%             pic = blue1;
%             pic2 = blue2;
%         end
%         
%         pic_d = im2double(pic);
%         pic2_d = im2double(pic2);
%         pic_freq = fft2(pic_d);
%         pic2_freq = fft2(pic2);
%         
%     temp = (pic_freq ./pic2_freq .* PSF_freq).*PSF_HAT_freq; 
%     temp2 = ifft2(temp);
%     New_restored_img(:,:,i) =pic2_freq.*temp2;
%     i = i+1;
%     end
%    
    %Image_d = im2double(Image);
%     Reconstructed_Image_d = im2double(reconstructed_Image);
%     Image_freq = fft2(Image_d);
%     Reconstructed_Image_freq = fft2(Reconstructed_Image_d);
%     
    %sizeofmatrix = size(Image);
    %sizeofmatrix = size(Image_freq);
    
    %desired size of conversion is the input size of y, so we converted
    %wi    th the size of y on H and C parameters.
    %PSF_HAT1= imfilter(PSF,'corr');
%     PSF_HAT2 = PSF(end:-1:1,end:-1:1);
%     PSF_freq = psf2otf(PSF,sizeofmatrix);
%     PSF_HAT_freq = psf2otf(PSF_HAT2,sizeofmatrix);
    
    %Applying the formula

%     temp = (Image_freq ./Reconstructed_Image_freq .* PSF_freq).*PSF_HAT_freq;
    %temp_time = ifft2(temp);
    
    
%     New_restored_img = ifft2(Reconstructed_Image_freq.*temp);

    
    

