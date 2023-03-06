classdef CarWashAdapterFactoryTests < matlab.unittest.TestCase    
    methods(Test)
        % Test methods
        function canInstantiateCarWashAdapter(testCase)
            config.isSimulation = true;
            cw = CarWashAdapterFactory.create(config);
            testCase.verifyNotEmpty(cw);
        end
    end    
end