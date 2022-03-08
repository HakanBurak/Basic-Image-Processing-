function VOTED = Law_filter(I,T_cell)
[s,z,~] = size(I);
%initilization of Guess and Voted Values
GUESS = zeros(s,z);
VOTED = zeros(s,z);
%pushing T to get model 
MODEL = training_phase(T_cell);
%pushing our image and model into recognition phase
GUESS = recognition_phase(I, MODEL);
%majority voting part
VOTED = majority_voting(GUESS, 6);

end