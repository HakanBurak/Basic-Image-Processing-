function [O] = image_segmenter(I, k)
    %getting the dimension of the image
    [h,w,~] = size(I);
    %resizing them according to S plane
    S = reshape(I,[h*w,3]);
    %create arbitary A matrix with the same size with S.
    A=zeros(size(S));
    [LUT, M] = mykmeans(S, k);
    for j = 1:k
        for index = 1:(w*h)
            if LUT(index) == j
                %basically what I do here is for every selection go all
                %over LUT and write values inside of A accordingly.
                A(index,:) = M(j,:);
            end
        end
    end
    %getting back to orginal shape to have a picture.
    O = reshape(A,[h,w,3]);

end
