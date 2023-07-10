classdef TicketValidatorTests < matlab.unittest.TestCase
    %TicketValidatorTests Test mehods for the ticket validator pure fabrica
    % tion
    
    methods(Test)
        % Test methods     
        function validateTicketReturnsTrueWhenTicketExistsAndCurrent(testCase)
            validTicket = Ticket('000001', WashTypes.Quick,datetime('today'));
            result = TicketValidator.validate(validTicket);
            testCase.verifyTrue(result.IsValid);
        end

        function validateTicketReturnsFalseWhenTicketDoesNotExist(testCase)
            result = TicketValidator.validate([]);
            testCase.verifyFalse(result.IsValid);
            testCase.verifyTrue(strcmp(result.Message, TicketValidationMessages.TicketDoesNotExit));
        end

        function validateTicketReturnsFalseWhenTicketHasExpired(testCase)
            expiredTicket = Ticket('000002', WashTypes.Quick, ...
                datetime(1900,1,1));
            result = TicketValidator.validate(expiredTicket);
            testCase.verifyFalse(result.IsValid);
            testCase.verifyTrue(strcmp(result.Message, TicketValidationMessages.ExpiredTicket));
        end
    end
end

