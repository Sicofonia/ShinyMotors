classdef TicketRepositoryTestAdapter < ITicketRepositoryAdapter
    %TicketRepositoryTestAdapter Ticket Repository Adapter used for testing
    properties(Access = private)
        Tickets
    end

    methods
        % Constructor
        function this = TicketRepositoryTestAdapter()
            yesterdayDate = datetime('yesterday');
            expiredDate = datetime(1900,1,1);
            validQuickWashTicket = Ticket('123456', WashType.Quick, yesterdayDate);
            validStandardWashTicket = Ticket('123457', WashType.Standard, yesterdayDate);
            validPremiumWashTicket = Ticket('123458', WashType.Premium, yesterdayDate);
            validUltimateWashTicket = Ticket('123459', WashType.Ultimate, yesterdayDate);
            expiredWashTicket = Ticket('000002', WashType.Ultimate, expiredDate);
            this.Tickets = [validQuickWashTicket, ...
                validStandardWashTicket, validPremiumWashTicket,...
                validUltimateWashTicket, expiredWashTicket];
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