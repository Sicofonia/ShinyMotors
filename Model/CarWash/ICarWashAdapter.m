classdef (Abstract) ICarWashAdapter
    %ICarWashSimulatorAdapter Interface for Car Wash Simulator Adapter
    %   This is the interface for interacting with the automatic
    %   car wash machine.
    
    methods
        result = startWash(~, wash)
        result = getWaterPumpStatus(~) % 1/0 working/not working
        result = getSoapLevel(~) % 0-100
        result = getWaxLevel(~) % 0-100
        result = getUltraShineLevel(~) % 0-100
    end
end

