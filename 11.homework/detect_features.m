function [FeaturePoints] = detect_features(I, feature_name)
    if  isequal(feature_name,'Harris')
      points  =  detectHarrisFeatures(I);
    elseif isequal(feature_name,'SURF')
      points  =  detectSURFFeatures(I);
    elseif isequal(feature_name,'BRISK')
      points  =  detectBRISKFeatures(I) ;       
    end
    FeaturePoints = points;
   
    

end
