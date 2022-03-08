function [T1,T2,T3] = region_selection(image_number,image)
%enter training boundries with my hand 
switch image_number
    case 1
        T1 = image(140:190,540:590);
        T2 = image(360:455,350:450);
        T3 = image(20:120,300:400);
    case 2
        T1 = image(500:600,1:800);       
        T2 = image(300:460,200:320);        
        T3 = image(215:300,455:633);
    case 3
        T1 = image(250:430,380:560);       
        T2 = image(100:600,35:249);       
        T3 = image(525:580,560:680);
    case 4
        T1 = image(200:300,30:130);        
        T2 = image(460:560,80:180);        
        T3 = image(120:220,460:560);
    case 5
        T1 = image(250:350,350:450);        
        T2 = image(350:600,50:200); 
        T3= image(530:540,600:610);
end

end
