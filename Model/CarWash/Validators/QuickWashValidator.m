classdef QuickWashValidator
    %QuickWashValidator Pure Fabrication class to validate car wash data
    %   Helps to validate whether or not the car was is ready to start
    %   a wash.
      
    methods
        function this = QuickWashValidator()
        end
        
        function result = canStartWash(~, waterPumpStatus, ~, ~, ~)        
            result = waterPumpStatus == 1;
        end
    end
end

