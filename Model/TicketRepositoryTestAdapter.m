classdef TicketRepositoryTestAdapter < ITicketRepositoryAdapter
    %TicketRepositoryTestAdapter Ticket Repository Adapter used for testing
    properties(Access = private)
        Codes = dictionary(['123456'], ['quick'])
    end

    methods
        function wash = getWash(this, code)
            %getWash Given a ticket code, return the associated wash type
            if(strlength(code) ~= 6)
                exception = MException('TicketRepositoryTestAdapter:wrongLength', ...
                'Code %s is not 6 characters long',code);
                throw(exception);
            end
            try
                wash = this.Codes(code);
            catch ex
                if(contains(ex.identifier, "ScalarKeyNotFound"))
                    wash = [];
                end
            end
        end
    end
end