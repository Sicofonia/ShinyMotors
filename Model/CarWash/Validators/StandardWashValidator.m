classdef StandardWashValidator < ICarWashValidator
    %StandardWashValidator Pure Fabrication class to validate car wash data
    %   Helps to validate whether or not the car was is ready to start
    %   a wash.
      
    methods  
        function this = StandardWashValidator()
        end

        function result = canStartWash(~, waterPumpStatus, soapLevel, ~, ~) 
            qw = QuickWashValidator();
            result = qw.canStartWash(waterPumpStatus) && soapLevel >= 10;
        end
    end
end

