classdef CarWashValidatorFactory
    %CARWASHVALIDATORFACTORY Responsible for instantiating objects
    %belonging to the CarWashValidator interface.
    
    methods(Static)
        function obj = create(washType)
            switch(washType)
                case WashType.Quick
                    obj = QuickWashValidator();
                case WashType.Standard
                    obj = StandardWashValidator();
                case WashType.Premium
                    obj = PremiumWashValidator();
                case WashType.Ultimate
                    obj = UltimateWashValidator();
                otherwise
                    obj = nil;
            end
        end
    end
end

