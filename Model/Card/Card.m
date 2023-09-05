classdef Card
    %CARD represents a card used for payment
    
    properties (SetAccess=immutable)
        Number
        Name
        ExpireDate
        CVV
    end
    
    methods
        function this = Card(number,name, expireDate, cvv)
            %CARD Construct an instance of this class
            this.Number = number;
            this.Name = name;
            this.ExpireDate = expireDate;
            this.CVV = cvv;
        end
    end
end

