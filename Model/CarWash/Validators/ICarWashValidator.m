classdef(Abstract) ICarWashValidator
    %ICarWashValidator Interface for Car Wash Validator
    % This is the interface for validating the car was machine state
    % prior starting a wash, protected variation at changing wash type
    
    methods
        result = canStartWash(~, waterPumpState, soapLevel, waxLevel, ...
            ultraShineLevel)
    end
end

