classdef PaymentTestAPIAdapter < IPaymentAPIAdapter
    %PaymentTestAPIAdapter An adapter used for testing purposes
    
    properties
        Card
    end
    
    methods
        function obj = PaymentTestAPIAdapter(card)
            %PaymentTestAPIAdapter Construct an instance of this class
            %   Detailed explanation goes here
            obj.Card = card;
        end
        
        function isValid = validate(~, pinNumber)
            %validate The test PIN is hardcoded to 0000
            isValid = pinNumber == "0000";
        end

        function success = chargeAmount(~, ~, ~)
            %chargeAmount The test charge amount will always succeed
            success = true;
        end
    end
end

