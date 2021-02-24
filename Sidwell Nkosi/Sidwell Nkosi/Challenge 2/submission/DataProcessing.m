

% Spltting the data into two data clusters 
c1LatData = [];
c1LonData = [];
c1devId = [];

c2LatData = [];
c2LonData = [];
c2devId = [];

c3LatData = [];
c3LonData = [];
c3devId = [];


 for i= 1: length(lat)
     
    if (lat(i) <= -26.1164)
        
       c1LatData(end + 1) = lat(i);
       c1LonData(end + 1) = lon(i);
       c1devId(end + 1) = deviceId(i);
       
    elseif ((lat(i) >= -26.1164) && (lat(i) ~= 0))
        
       c2LatData(end + 1) = lat(i);
       c2LonData(end + 1) = lon(i);
       c2devId(i) = deviceId(i);
       
    else
       c3LatData(end + 1) = lat(i);
       c3LonData(end + 1) = lon(i);
       c3devId(i) = deviceId(i);
    end 
    
    
 end

 
% Counting how many times each GPS coordinate was visited in Cluster 1 
 c1UniPointCount = []; 
 c1MaxUniLat = [];
 c1MaxUniLon = [];
 
 
 for i=1: length(c1LatData)
     
   latPoint = c1LatData(i);
   lonPoint = c1LonData(i);
   
   count = 0;
   
   for k = 1: length(c1LatData)
       
       if ((latPoint == c1LatData(k)) && (lonPoint == c1LonData(k)))
           count = count + 1;

       end 
   end
   
   if (count > 0)
      c1MaxUniLat(end +1) =  latPoint;
      c1MaxUniLon(end +1) = lonPoint;
      c1UniPointCount(end +1) = count;
   end 
   

 end 
 
 % Counting how many times each GPS coordinate was visited in Cluster 2 
 c2UniPointCount = []; 
 c2MaxUniLat = [];
 c2MaxUniLon = [];
 
 for i=1: length(c2LatData)
     
   latPoint = c2LatData(i);
   lonPoint = c2LonData(i);
   
   count = 0;
   
   for k = 1: length(c2LatData)
       
       if ((latPoint == c2LatData(k)) && (lonPoint == c2LonData(k)))
           count = count + 1;

       end 
   end
   
   if (count > 0)
      c2MaxUniLat(end +1) =  latPoint;
      c2MaxUniLon(end +1) = lonPoint;
      c2UniPointCount(end +1) = count;
   end 
   

 end 
 
 length(c2MaxUniLat)
 X =unique(c2MaxUniLat);
 length(X)
 
%  Loading most visited coordinates into containers for Cluster 1 
 c1MaxUniPointsCount = [];
 c1MaxUniPointsLat = [];
 c1MaxUniPointsLon = [];
 
 
 for k = 1 : length(c1UniPointCount)
     if(c1UniPointCount(k) > 2 )
         
        c1MaxUniPointsCount(end +1) =  c1UniPointCount(k);
        c1MaxUniPointsLat(end +1) =  c1MaxUniLat(k);
        c1MaxUniPointsLon(end +1) =  c1MaxUniLon(k);
     end
 end 
 
 %  Loading most visited coordinates into containers for Cluster 1 
 c2MaxUniPointsCount = [];
 c2MaxUniPointsLat = [];
 c2MaxUniPointsLon = [];
 
 
 for k = 1 : length(c2UniPointCount)
     if(c2UniPointCount(k) > 2 )
         
        c2MaxUniPointsCount(end +1) =  c2UniPointCount(k);
        c2MaxUniPointsLat(end +1) =  c2MaxUniLat(k);
        c2MaxUniPointsLon(end +1) =  c2MaxUniLon(k);
     end
 end 
 




 

