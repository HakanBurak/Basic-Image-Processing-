function [BGR] = swap_RB_dump(RGB)
    for i = 1:402                %iterate over each row
    for j = 1:608            %iterate over each column            
            
            BGR(i,j,1) = RGB(i,j,3); %Swap Blue and Red
            BGR(i,j,2) = RGB(i,j,2); %Swap Nothing
            BGR(i,j,3) = RGB(i,j,1); %Swap Red and Blue
            
     end
   end
end
