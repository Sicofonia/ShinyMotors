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
        function GetTicketReturnsEmptyWhenCodeDoesNOTExistInDatabase(testCase)
            testAdapter = TicketRepositoryAdapterFactory.create(testCase.config);
            ticket = testAdapter.getTicket('000000');
            testCase.verifyEmpty(ticket);
        end

        function GetTicketReturnsValidQuickWashTicketWhenCodeExistsInDatabase(testCase)
            testAdapter = TicketRepositoryAdapterFactory.create(testCase.config);
            ticket = testAdapter.getTicket('123456');
            testCase.verifyEqual(ticket.getWashType(), Wash_Types.Quick);
        end

        function GetWashThrowsErrorWhenCodeBiggerThan6Chars(testCase)
            testAdapter = TicketRepositoryAdapterFactory.create(testCase.config);
            verifyError(testCase,@()testAdapter.getTicket('123456789'),...
                "TicketRepositoryTestAdapter:wrongLength");
        end

        function GetWashThrowsErrorWhenCodeShorterThan6Chars(testCase)
            testAdapter = TicketRepositoryAdapterFactory.create(testCase.config);
            verifyError(testCase,@()testAdapter.getTicket('123'),...
                "TicketRepositoryTestAdapter:wrongLength");
        end
    end

end