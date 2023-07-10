classdef UltimateWashValidator
    %UltimateWashValidator Pure Fabrication class to validate car wash data
    %   Helps to validate whether or not the car was is ready to start
    %   a wash.
      
    methods
        function this = UltimateWashValidator()
        end
        
        function result = canStartWash(~,waterPumpStatus, soapLevel,...
                waxLevel, ultraShineLevel)    
            pw = PremiumWashValidator();
            result = pw.canStartWash(waterPumpStatus,soapLevel, waxLevel) && ...
                ultraShineLevel > 5;
        end
    end
end

