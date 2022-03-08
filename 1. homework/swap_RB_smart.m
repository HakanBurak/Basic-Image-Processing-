function [BGR] = swap_RB_smart(RGB)
% Extract color channels.
 redChannel = RGB(:,:,1); % Red channel
 greenChannel = RGB(:,:,2); % Green channel
 blueChannel = RGB(:,:,3); % Blue channel
 BGR(:,:,1) = blueChannel; %Swap Blue and Red
 BGR(:,:,2) = greenChannel; %Swap Nothing
 BGR(:,:,3) = redChannel; %Swap Red and Blue
end