function [F] = my_fourier(I)
    rows= size(I,1);
    columns = size(I,2);
    F = complex(zeros(size(I)));
    for k1=0:size(F,1)-1
        for k2 = 0:size(F,2)-1
            for n1 = 0:rows-1
                for n2= 0:columns-1
                    F(k1+1,k2+1) = complex(F(k1+1,k2+1)+I(n1+1,n2+1)*exp(-1*1i*2*pi*k1*n1/(rows))*exp(-1*1i*2*pi*k2*n2/(columns)));
                        
                end
            end
        end
    end
end
