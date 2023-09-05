classdef PremiumWashValidator < ICarWashValidator
    %PremiumWashValidator Pure Fabrication class to validate car wash data
    %   Helps to validate whether or not the car was is ready to start
    %   a wash.
      
    methods
        function this = PremiumWashValidator()
        end
        
        function result = canStartWash(~,waterPumpStatus, soapLevel,...
                waxLevel, ~)    
            sw = StandardWashValidator();
            result = sw.canStartWash(waterPumpStatus,soapLevel) && ...
                waxLevel > 5;
        end
    end
end

