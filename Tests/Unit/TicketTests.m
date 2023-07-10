classdef TicketTests < matlab.unittest.TestCase
    
    properties(Access=public)
        TestTicket
    end

    methods(TestClassSetup)        
        function instantiateTestTicket(testCase)
            testCase.TestTicket = Ticket('123456', WashTypes.Quick, ...
                datetime(2023,1,1));
        end
    end
    
    methods(Test)
        % Test methods     
        function getCodeReturnsTicketCode(testCase)
            testCase.verifyEqual(testCase.TestTicket.getCode(),'123456');
        end

        function getWashTypeReturnsWashType(testCase)
            testCase.verifyEqual(testCase.TestTicket.getWashType(), WashTypes.Quick);
        end

        function getPurchasedDateReturnsPurchasedDate(testCase)
            expectedDate = datetime(2023,1,1);
            testCase.verifyEqual(testCase.TestTicket.getPurchasedDate(),...
                expectedDate);
        end
    end
    
end