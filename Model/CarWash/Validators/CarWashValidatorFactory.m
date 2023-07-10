classdef CarWashValidatorFactory
    %CARWASHVALIDATORFACTORY Responsible for instantiating objects
    %belonging to the CarWashValidator interface.
    
    methods(Static)
        function obj = create(washType)
            switch(washType)
                case WashTypes.Quick
                    obj = QuickWashValidator();
                case WashTypes.Standard
                    obj = StandardWashValidator();
                case WashTypes.Premium
                    obj = PremiumWashValidator();
                case WashTypes.Ultimate
                    obj = UltimateWashValidator();
                otherwise
                    obj = nil;
            end
        end
    end
end

