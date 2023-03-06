classdef TicketRepositoryFactoryTests < matlab.unittest.TestCase

    methods (Test)
        % Test methods

        function TicketRepositoryFactoryCreatesTestAdapter(testCase)
            config.isSimulation = true;
            factory = TicketRepositoryAdapterFactory.create(config);
            testCase.verifyNotEmpty(factory);
        end

        function TicketRepositoryFactoryCreatesPurchaseAdapter(testCase)
            config.isSimulation =  false;
            factory = TicketRepositoryAdapterFactory.create(config);
            testCase.verifyNotEmpty(factory);
        end
    end

end