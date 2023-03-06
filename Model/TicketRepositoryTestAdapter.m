classdef TicketRepositoryTestAdapter < ITicketRepositoryAdapter
    %TicketRepositoryTestAdapter Ticket Repository Adapter used for testing
    properties(Access = private)
        Tickets
    end

    methods
        % Constructor
        function this = TicketRepositoryTestAdapter()
            validQuickWashTicket = Ticket('123456', Wash_Types.Quick);
            this.Tickets = [validQuickWashTicket];
        end

        function ticket = getTicket(this, code)
            % getTicket Given a ticket code, return the Ticket object
            if(strlength(code) ~= 6)
                exception = MException('TicketRepositoryTestAdapter:wrongLength', ...
                'Code %s is not 6 characters long',code);
                throw(exception);
            end
            for idx = 1:length(this.Tickets)
                if(this.Tickets(idx).getCode() == code)
                    ticket = this.Tickets(idx);
                    return;
                end
            end
            ticket = [];
        end
    end
end