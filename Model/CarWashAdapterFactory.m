classdef CarWashAdapterFactory
    %CarWashAdapterFactory Class responsible for instantiating classes
    %   inheriting from ICarWashAdapter interface
    
    methods(Static)
        function obj = create(config)
            switch(config.isSimulation)
                case true
                    obj = CarWashSimulatorAdapter();
                otherwise
                    obj = CarWashAdapter(config);
            end
        end
    end
end

