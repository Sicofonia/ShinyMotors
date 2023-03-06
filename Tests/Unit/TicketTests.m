classdef TicketTests < matlab.unittest.TestCase
    
    properties(Access=public)
        TestTicket
    end

    methods(TestClassSetup)        
        function instantiateTestTicket(testCase)
            testCase.TestTicket = Ticket('123456', Wash_Types.Quick);
        end
    end
    
    methods(Test)
        % Test methods     
        function getCodeReturnsTicketCode(testCase)
            testCase.verifyEqual(testCase.TestTicket.getCode(),'123456');
        end

        function getWashTypeReturnsWashType(testCase)
            testCase.verifyEqual(testCase.TestTicket.getWashType(), Wash_Types.Quick);
        end
    end
    
end