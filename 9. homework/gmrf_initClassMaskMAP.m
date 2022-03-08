function mrf=gmrf_initClassMaskMAP(mrf)

 cmap = load('MRF_colormap.mat'); % the colormap
    h = mrf.imagesize(1);         % height of the image
    w = mrf.imagesize(2);         % width of the image
 cnum = mrf.classnum;             % number of classes

    for y=1:h
        for x=1:w

            % ====================================== %
            %                                        %
            %    Please, put your implementation     %
            %             BELOW THIS LINE            %
            %                                        %
            % ====================================== %
            temp = zeros(1,cnum);
            for ind=1:cnum
                temp(ind) = mrf.logProbs{ind}(y, x);
            end
              [~,minind]= min(temp);
            
            
            
            
            
            
            
            
            % ====================================== %
            %                                        %
            %    Please, put your implementation     %
            %             ABOVE THIS LINE            %
            %                                        %
            % ====================================== %             
            
            mrf.classmask(y,x) = minind;
            
        end
    end
    
    imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));

end