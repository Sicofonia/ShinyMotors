classdef PurchasedTicketRepositoryAdapter < ITicketRepositoryAdapter
    %PurchasedTicketRepositoryAdapter TO-DO: This would have been the class
    %to retrieve tickets purchased for the real system. It is left in the
    %project to illustrate the Factory pattern.
    methods
        function wash = getTicket(obj, code)
            %getWash Given a ticket code, return the associated wash type
            exception = MException('PurchasedTicketRepositoryAdapter:notImplemented','Method not implemented.');
            throw(exception);
        end
    end
end