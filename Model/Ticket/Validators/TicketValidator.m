classdef TicketValidator
    %TICKETVALIDATOR Pure fabrication that checks whether or not a ticket
    % is valid
    %   Returns an instance of TicketValidationResult
    
    methods(Static)
        function result = validate(ticket)
            if(isempty(ticket))
                result = TicketValidationResult(false, 'Code entered not valid - Wrong Code');
            else
                date72hoursPrior = datetime('today') - hours(72);
                isValid = ticket.getPurchasedDate() > date72hoursPrior;
                msg = '';
                if(~isValid)
                    msg = TicketValidationMessages.ExpiredTicket;
                end
                result = TicketValidationResult(isValid, msg);
            end
        end
    end
end

