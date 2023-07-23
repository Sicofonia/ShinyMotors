classdef PaymentAPIFactory
    %PaymentAPIFactory Creates instances of Payment APIs
    %   Only support for VISA and Test APIs for now
       
    methods(Static)       
        function paymentAPI = create(cardNumber)
            % Very simplistic way of parsing card numbers, in real world
            % regular expressions would be the way to go.
            firstDigit = extract(cardNumber,1);
            if(firstDigit == '0')
                paymentAPI = PaymentTestAPIAdapter();
            else
                paymentAPI = PaymentVisaAPIAdapter();
            end
        end
    end
end

