classdef CardReaderAdapter < ICardReaderAdapter
    %CardReaderAdapter An adapter used for reading physical credit/debit
    %cards. Left in stub state.
    
    methods
        function obj = CardReaderAdapter()
            %CardReaderAdapter Construct an instance of this class
        end
        
        function readCard(~)
            %readCard returns a credit/debit card number
            exception = MException('CardReaderAdapter:notImplemented','This method is not implemented.');
            throw(exception);
        end
    end
end

