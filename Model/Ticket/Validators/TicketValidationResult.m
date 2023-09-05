classdef TicketValidationResult
    %TICKETVALIDATIONRESULT Pure fabrication to hold the information related to ticket
    %validation
    
    properties(SetAccess=protected, GetAccess=public)
        IsValid
        Message
    end
    
    methods
        function this = TicketValidationResult(isValid,message)
            this.IsValid = isValid;
            this.Message = message;
        end
    end
end

