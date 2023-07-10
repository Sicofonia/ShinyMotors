classdef CarWashValidatorFactoryTests < matlab.unittest.TestCase    
    methods(Test)
        % Test methods
        function canInstantiateQuickWashValidator(testCase)
            cw = CarWashValidatorFactory.create(WashTypes.Quick);
            testCase.verifyNotEmpty(cw);
        end

        function canInstantiateStandardWashValidator(testCase)
            cw = CarWashValidatorFactory.create(WashTypes.Standard);
            testCase.verifyNotEmpty(cw);
        end

        function canInstantiatePremiumWashValidator(testCase)
            cw = CarWashValidatorFactory.create(WashTypes.Premium);
            testCase.verifyNotEmpty(cw);
        end

        function canInstantiateUltimateWashValidator(testCase)
            cw = CarWashValidatorFactory.create(WashTypes.Ultimate);
            testCase.verifyNotEmpty(cw);
        end
    end    
end