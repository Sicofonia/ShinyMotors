classdef WashesRepositoryTestAdapter
    %WASHESREPOSITORYTESTADAPTER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        WashCodes
    end
    
    methods
        function this = WashesRepositoryTestAdapter()
            this.WashCodes = ["000000", "000001"];
        end
        
        function code = getWash(this,washCode)
            code = "";
            for i = 1:length(this.WashCodes)
                if(washCode == this.WashCodes(i))
                    code = washCode;
                    return;
                end
            end
        end
    end
end

