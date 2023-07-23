classdef CarWashProgramFactoryTests < matlab.unittest.TestCase
    methods(Test)
        % Test methods
        function canInstantiateCarWashQuickProgram(testCase)
            cwp = CarWashProgramFactory.create(WashType.Quick);

            testCase.verifyClass(cwp, ?CarWashProgram);
            testCase.verifyEqual(cwp.Price, 7);
        end

        function canInstantiateCarWashStandardProgram(testCase)
            cwp = CarWashProgramFactory.create(WashType.Standard);

            testCase.verifyClass(cwp, ?CarWashProgram);
            testCase.verifyEqual(cwp.Price, 9);
        end

        function canInstantiateCarWashPremiumProgram(testCase)
            cwp = CarWashProgramFactory.create(WashType.Premium);

            testCase.verifyClass(cwp, ?CarWashProgram);
            testCase.verifyEqual(cwp.Price, 11);
        end

        function canInstantiateCarWashUltimateProgram(testCase)
            cwp = CarWashProgramFactory.create(WashType.Ultimate);

            testCase.verifyClass(cwp, ?CarWashProgram);
            testCase.verifyEqual(cwp.Price, 15);
        end

        function creatingCarWashProgramErrorsWhenTypeNotRecognized(testCase)
            verifyError(testCase,@()CarWashProgramFactory.create("Unknown"),...
                "CarWashProgramFactory:UnknownType");
        end

        function canGetAllWashProgramsAvailable(testCase)           
            programs = CarWashProgramFactory.getAll();
            
            testCase.verifyEqual(length(programs), 4);
            testCase.verifyClass(programs(1), ?CarWashProgram);
        end
    end
end

