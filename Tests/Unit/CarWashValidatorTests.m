classdef CarWashValidatorTests < matlab.unittest.TestCase  
    %CarWashValidatorTests Unit tests for the CarWashSimulatorAdapter class   
    methods(Test)       
        function FailsValidationWhenWaterPumpFails(testCase)
            wv = CarWashValidatorFactory.create(WashType.Quick);
            result = wv.canStartWash(0, 100, 100);
            testCase.verifyTrue(result == false);
        end

        function FailsValidationWhenSoapLevelLessThan10ForStandard(testCase)
            wv = CarWashValidatorFactory.create(WashType.Standard);
            result = wv.canStartWash(1, 5, 100);
            testCase.verifyTrue(result == false);
        end

        function FailsValidationWhenWaxLevelLessThan5ForPremiumWash(testCase)
            wv = CarWashValidatorFactory.create(WashType.Premium);
            result = wv.canStartWash(1, 100, 4);
            testCase.verifyTrue(result == false);
        end

        function FailsValidationWhenUltraShinelLessThan5ForUltimateWash(testCase)
            wv = CarWashValidatorFactory.create(WashType.Ultimate);
            result = wv.canStartWash(1, 100, 100,2);
            testCase.verifyTrue(result == false);
        end

        function SucceedsValidationWhenWaterPumpWorks(testCase)
            wv = CarWashValidatorFactory.create(WashType.Quick);
            result = wv.canStartWash(1, 100, 100);
            testCase.verifyTrue(result);
        end

        function SucceedsValidationForStandard(testCase)
            wv = CarWashValidatorFactory.create(WashType.Standard);
            result = wv.canStartWash(1, 100);
            testCase.verifyTrue(result);
        end

        function SucceedsValidationForPremium(testCase)
            wv = CarWashValidatorFactory.create(WashType.Premium);
            result = wv.canStartWash(1, 100, 100);
            testCase.verifyTrue(result);
        end

        function SucceedsValidationForUltimate(testCase)
            wv = CarWashValidatorFactory.create(WashType.Ultimate);
            result = wv.canStartWash(1, 100, 100, 100);
            testCase.verifyTrue(result);
        end
    end
end