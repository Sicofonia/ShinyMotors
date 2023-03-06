classdef (Abstract) ITicketRepositoryAdapter
    %Interface for Ticket Repository Adapters
    methods
        function wash = getWash(obj, code)
            %getWash Given a ticket code, return the associated wash type
        end
    end
end