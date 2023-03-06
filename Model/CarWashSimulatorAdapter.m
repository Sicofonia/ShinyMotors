classdef CarWashSimulatorAdapter < ICarWashAdapter
    %CARWASHSIMULATORADAPTER Summary of this class goes here
    %   Detailed explanation goes here

    properties (Access = private)
        modelName = 'CarWashSimulinkSimulator';
    end
        
    methods
        function obj = CarWashSimulatorAdapter()
            %CARWASHSIMULATORADAPTER Construct an instance of this class
        end
        
        function response = startWash(this, wash)
            %startWash Method to start a simulation wash
            %   Given a wash type, triggers a simulation of the car wash
            open_system(this.modelName);
            response = sim(this.modelName);
        end
    end
end

