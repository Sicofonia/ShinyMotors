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
            testCase.verifyEqual(ticket.getWashType(), WashType.Quick);
        end

        function GetTicketReturnsValidStandardWashTicketWhenCodeExistsInDatabase(testCase)
            testAdapter = TicketRepositoryAdapterFactory.create(testCase.config);
            ticket = testAdapter.getTicket('123457');
            testCase.verifyEqual(ticket.getWashType(), WashType.Standard);
        end

        function GetTicketReturnsValidPremiumWashTicketWhenCodeExistsInDatabase(testCase)
            testAdapter = TicketRepositoryAdapterFactory.create(testCase.config);
            ticket = testAdapter.getTicket('123458');
            testCase.verifyEqual(ticket.getWashType(), WashType.Premium);
        end

        function GetTicketReturnsValidUltimateWashTicketWhenCodeExistsInDatabase(testCase)
            testAdapter = TicketRepositoryAdapterFactory.create(testCase.config);
            ticket = testAdapter.getTicket('123459');
            testCase.verifyEqual(ticket.getWashType(), WashType.Ultimate);
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