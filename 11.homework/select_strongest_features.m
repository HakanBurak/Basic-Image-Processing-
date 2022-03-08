function [FeaturePointsOut] = select_strongest_features(FeaturePoints, upper_limit, min_metric)
    if isa(FeaturePoints,'Harris')
        FeaturePointsOut = cornerPoints();
    elseif isa(FeaturePoints,'SURF')
        FeaturePointsOut = SURFPoints();
    elseif isa(FeaturePoints,'BRISK')
        FeaturePointsOut = BRISKPoints();
    end
    
 [~, idx] = sort(FeaturePoints.Metric, 'descend');

if size(idx,1) > upper_limit
     FeaturePointsOut = FeaturePoints(1:upper_limit);

else
	FeaturePointsOut = FeaturePoints;
end


 for i = 1:size(FeaturePointsOut,1)
     if FeaturePointsOut.Metric(i) < min_metric
         FeaturePointsOut(i:end) =[];
         break;
     end
     
 end
 
end
