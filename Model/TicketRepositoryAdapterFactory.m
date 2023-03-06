classdef TicketRepositoryAdapterFactory
    %TicketRepositoryFactory Responsible for instantiating
    %TicketRepositoryAdapters
    
    methods(Static)
        function obj = create(config)
            switch(config.isSimulation)
                case true
                    obj = TicketRepositoryTestAdapter();
                otherwise
                    obj = PurchasedTicketRepositoryAdapter();
            end
        end
    end
end

