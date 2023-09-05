classdef TestCardReaderAdapter < ICardReaderAdapter
    %TESTCARDREADER An adapter used for testing and simulation purposes
    
    methods
        function obj = TestCardReaderAdapter()
            %TESTCARDREADER Construct an instance of this class
        end
        
        function card = readCard(~)
            %readCard returns a test card number
            % pause to simulate waiting for user to insert card
            pause(2);          
            cardNumber = "0000-0000-0000-0000";
            name = 'test';
            expireDate = datetime(2999,12,31);
            cvv = 000;
            card = Card(cardNumber,name,expireDate,cvv);
        end
    end
end

