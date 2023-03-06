classdef Ticket
    %TICKET This class represents a ticket purchased from checkout
    
    properties(Access = private)
        Code
        WashType
    end
    
    methods
        function this = Ticket(code,washType)
            %TICKET Construct an instance of this class
            this.Code = code;
            this.WashType = washType;
        end
        
        function outputArg = getCode(this)
            % getCode Returns wash code property
            outputArg = this.Code;
        end

        function outputArg = getWashType(this)
            % getCode Returns wash type property
            outputArg = this.WashType;
        end
    end
end

