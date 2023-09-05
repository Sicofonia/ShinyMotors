classdef PaymentVisaAPIAdapter < IPaymentAPIAdapter
    %PaymentVisaAPIAdapter Dummy class to represent the actual adapter
    %   to interface with the Visa API. This has been added to illustrate
    %   how the factory class would generate different adapters on
    %   execution time.
    
    properties
        Card
    end
    
    methods
        function this = PaymentVisaAPIAdapter(card)
            %PaymentVisaAPIAdapter Construct an instance of this class
            this.Card = card;
        end
        
        function result = validate(~, ~)
            %validate In theory, this method would wrap the Visa API
            result = MException('PaymentVisaAPIAdapter:notImplemented','Method not implemented.');
            throw(result);
        end

        function chargeAmount(~, ~, ~)
            %chargeAmount In theory, this method would wrap the Visa API
            exception = MException('PaymentVisaAPIAdapter:notImplemented','Method not implemented.');
            throw(exception);
        end
    end
end

