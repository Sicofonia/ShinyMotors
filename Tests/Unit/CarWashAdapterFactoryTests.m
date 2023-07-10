classdef CarWashAdapterFactoryTests < matlab.unittest.TestCase    
    methods(Test)
        % Test methods
        function canInstantiateCarWashAdapter(testCase)
            config.isSimulation = true;
            config.WaterPumpStatus = 1;
            config.SoapLevel = 100;
            config.WaxLevel = 100;
            config.UltraShineLevel = 100;
            cw = CarWashAdapterFactory.create(config);
            testCase.verifyNotEmpty(cw);
        end
    end    
end