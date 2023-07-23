classdef Ticket
    %TICKET This class represents a ticket purchased from checkout
    
    properties(Access = private)
        Code          % string
        WashType      % WashType
        PurchasedDate % datetime
    end
    
    methods
        function this = Ticket(code, washType, purchasedDate)
            %TICKET Construct an instance of this class
            this.Code = code;
            this.WashType = washType;
            this.PurchasedDate = purchasedDate;
        end
        
        function outputArg = getCode(this)
            % getCode Returns wash code property
            outputArg = this.Code;
        end

        function outputArg = getWashType(this)
            % getCode Returns wash type property
            outputArg = this.WashType;
        end

        function outputArg = getPurchasedDate(this)
            % getCode Returns wash type property
            outputArg = this.PurchasedDate;
        end
    end
end

