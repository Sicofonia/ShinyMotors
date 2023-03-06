classdef TicketRepositoryAdapterTests < matlab.unittest.TestCase
    properties
        config
    end

    methods(TestClassSetup)
        function setup(testCase)
            testCase.config.isSimulation = true;
        end
        
    end

    methods (Test)
        % Test methods
        function GetWashReturnsEmptyWhenCodeDoesNOTExistInDatabase(testCase)
            testAdapter = TicketRepositoryAdapterFactory.create(testCase.config);
            wash = testAdapter.getWash('000000');
            testCase.verifyEmpty(wash);
        end

        function GetWashReturnsWashWhenCodeExistsInDatabase(testCase)
            testAdapter = TicketRepositoryAdapterFactory.create(testCase.config);
            wash = testAdapter.getWash('123456');
            testCase.verifyNotEmpty(wash);
        end

        function GetWashThrowsErrorWhenCodeBiggerThan6Chars(testCase)
            testAdapter = TicketRepositoryAdapterFactory.create(testCase.config);
            verifyError(testCase,@()testAdapter.getWash('123456789'),...
                "TicketRepositoryTestAdapter:wrongLength");
        end

        function GetWashThrowsErrorWhenCodeShorterThan6Chars(testCase)
            testAdapter = TicketRepositoryAdapterFactory.create(testCase.config);
            verifyError(testCase,@()testAdapter.getWash('123'),...
                "TicketRepositoryTestAdapter:wrongLength");
        end
    end

end