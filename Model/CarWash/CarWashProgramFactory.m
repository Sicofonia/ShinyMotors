classdef CarWashProgramFactory
    %CARWASHPROGRAMFACTORY Summary of this class goes here
    methods(Static)
        function obj = create(washType)
            switch(washType)
                case WashType.Quick
                    obj = CarWashProgram("Quick", "Water spray", washType, 7);
                case WashType.Standard
                    obj = CarWashProgram("Standard", ...
                        "Water spray, foam, air dry", washType, 9);
                case WashType.Premium
                    obj = CarWashProgram("Premium", ...
                        "Water spray, foam, air dry, liquid wax", washType, 11);
                case WashType.Ultimate
                    obj = CarWashProgram("Ultimate", ...
                        "Water spray, foam, air dry, liquid wax, UltraShine ™", washType, 15);
                otherwise
                    exception = MException('CarWashProgramFactory:UnknownType', ...
                        "Unrecognized wash type");
                    throw(exception);
            end
        end

        function washPrograms = getAll()
            washPrograms = [CarWashProgramFactory.create(WashType.Quick),...
                CarWashProgramFactory.create(WashType.Standard), ...
                CarWashProgramFactory.create(WashType.Premium), ...
                CarWashProgramFactory.create(WashType.Ultimate)];
        end
    end
end

