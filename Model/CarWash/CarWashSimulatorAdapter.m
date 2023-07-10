classdef CarWashSimulatorAdapter < ICarWashAdapter
    %CARWASHSIMULATORADAPTER Summary of this class goes here
    %   Detailed explanation goes here

    properties (Access = private)
        modelName = 'CarWashSimulinkSimulator';
        waterPumpStatus;
        soapLevel;
        waxLevel;
        ultraShineLevel;
    end
        
    methods
        function this = CarWashSimulatorAdapter(config)
            %CARWASHSIMULATORADAPTER Construct an instance of this class
            this.waterPumpStatus = config.WaterPumpStatus;
            this.soapLevel = config.SoapLevel;
            this.waxLevel = config.WaxLevel;
            this.ultraShineLevel = config.UltraShineLevel;
        end
        
        function response = startWash(this, wash)
            %startWash Method to start a simulation wash
            %   Given a wash type, triggers a simulation of the car wash
            open_system(this.modelName);
            simIn = Simulink.SimulationInput(this.modelName);
            simIn = setVariable(simIn,'WashType',wash,...
                'Workspace',this.modelName);
            simIn = setVariable(simIn,'WaterPumpStatus',this.waterPumpStatus,...
                'Workspace',this.modelName);
            simIn = setVariable(simIn,'SoapLevel',this.soapLevel,...
                'Workspace',this.modelName);
            simIn = setVariable(simIn,'WaxLevel',this.waxLevel,...
                'Workspace',this.modelName);
            simIn = setVariable(simIn,'UltraShineLevel',this.ultraShineLevel,...
                'Workspace',this.modelName);
            response = sim(simIn);
        end

        function response = getWaterPumpStatus(this)
            response = this.waterPumpStatus;
        end

        function response = getSoapLevel(this)
            response = this.soapLevel;
        end

        function response = getWaxLevel(this)
            response = this.waxLevel;
        end

        function response = getUltraShineLevel(this)
            response = this.waxLevel;
        end
    end
end

