classdef CarWashValidatorFactoryTests < matlab.unittest.TestCase    
    methods(Test)
        % Test methods
        function canInstantiateQuickWashValidator(testCase)
            cw = CarWashValidatorFactory.create(WashType.Quick);
            testCase.verifyNotEmpty(cw);
        end

        function canInstantiateStandardWashValidator(testCase)
            cw = CarWashValidatorFactory.create(WashType.Standard);
            testCase.verifyNotEmpty(cw);
        end

        function canInstantiatePremiumWashValidator(testCase)
            cw = CarWashValidatorFactory.create(WashType.Premium);
            testCase.verifyNotEmpty(cw);
        end

        function canInstantiateUltimateWashValidator(testCase)
            cw = CarWashValidatorFactory.create(WashType.Ultimate);
            testCase.verifyNotEmpty(cw);
        end
    end    
end