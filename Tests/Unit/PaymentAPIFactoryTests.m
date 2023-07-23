classdef PaymentAPIFactoryTests < matlab.unittest.TestCase    
    methods(Test)
        % Test methods
        function canInstantiatePaymentTestAdapter(testCase)
            cardNumber = "0000-0000-0000-0000";
            ps = PaymentAPIFactory.create(cardNumber);
            testCase.verifyClass(ps, ?PaymentTestAPIAdapter);
        end

        function canInstantiatePaymentVisaAdapter(testCase)
            cardNumber = "4319-7722-6633-5544";
            ps = PaymentAPIFactory.create(cardNumber);
            testCase.verifyClass(ps, ?PaymentVisaAPIAdapter);
        end
    end    
end
