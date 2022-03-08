function mrf=gmrf_doMMD(mrf)

cmap = load('MRF_colormap.mat'); % the colormap
h = mrf.imagesize(1);         % height of the image
w = mrf.imagesize(2);         % width of the image
cnum = mrf.classnum;             % number of classes
beta = mrf.Beta;                 % value of parameter beta
DeltaUmin = mrf.DeltaUmin;            % value of minimal necessary energy change
T = mrf.T0;                   % temperature at the begining
c = mrf.c;                    % the c constant parameter


cycle = 0;
summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

while summa_deltaE > DeltaUmin
    
    % ====================================== %
    %                                        %
    %    Please, put your implementation     %
    %             BELOW THIS LINE            %
    %                                        %
    % ====================================== %
    summa_deltaE = 0;
    cycle = cycle +1;
    
    for y = 1:h
        for x = 1:w
            current_label = mrf.classmask(y, x);
            class_label = [];
            for neighbory = max(1, y - 1):min(h, y + 1)
                for neighborx = max(1, x-1):min(w, x+1)
                    if neighbory ~= y || neighborx ~= x
                        class_label = [class_label, mrf.classmask(neighbory, neighborx)];
                    end
                end
            end
            
            Actual_posterior_probability =mrf.logProbs{current_label}(y,x);
            Actual_prior_probability= ((sum(class_label(:) ~= current_label))* beta) - ((sum(class_label(:) == current_label))* beta);
            
            
            random_label = randi(cnum);
            while random_label == current_label
                random_label =randi(cnum);
            end
            new_posterior_probability =mrf.logProbs{random_label}(y,x);
            new_prior_probability= ((sum(class_label(:) ~=  random_label))* beta) - ((sum(class_label(:) ==  random_label))* beta);
            Actual_energy = Actual_posterior_probability + Actual_prior_probability;
            new_energy = new_posterior_probability + new_prior_probability;
            Energy_change =  new_energy - Actual_energy;
            e = rand();
            if Energy_change < 0 || (Energy_change > 0 && e< exp(-Energy_change/T))
                summa_deltaE = summa_deltaE + abs(Energy_change);
                mrf.classmask(y, x) = random_label;
            end
        end
    end
    T = T * c;    
% ====================================== %
%                                        %
%    Please, put your implementation     %
%             ABOVE THIS LINE            %
%                                        %
% ====================================== %

imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
%fprintf('Iteration #%i\n', cycle);
title(['Class map in cycle ', num2str(cycle)]);
drawnow;
end
end
