classdef CarWashProgram
    % CARWASHPROGRAM Represents a car wash program
    
    properties
        Name;
        Description;
        ProgramType;
        Price;
    end
    
    methods
        function this = CarWashProgram(name, description, washProgramType, price)
            %CARWASHPROGRAM Construct an instance of this class
            this.Name = name;
            this.Description = description;
            this.ProgramType = washProgramType;
            this.Price = price;
        end
    end
end

