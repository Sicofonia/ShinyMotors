classdef Card
    %CARD represents a card used for payment
    
    properties (SetAccess=immutable)
        Number
        Name
        ExpireDate
        CVC
    end
    
    methods
        function this = Card(number,name, expireDate, cvc)
            %CARD Construct an instance of this class
            this.Number = number;
            this.Name = name;
            this.ExpireDate = expireDate;
            this.CVC = cvc;
        end
    end
end

