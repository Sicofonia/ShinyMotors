classdef (Abstract) IPaymentAPIAdapter
    %IPaymentAPIAdapter Interface for Payment API Adapter
    %   This is the interface for interacting with the different payment
    %   APIs
    
    methods
        result = validate(~, cardNumber)
        result = chargeAmount(~, amount, currency)
    end
end