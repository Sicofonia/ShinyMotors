classdef CarWashAdapterFactory
    %CarWashAdapterFactory Class responsible for instantiating classes
    %   inheriting from ICarWashAdapter interface
    
    methods(Static)
        function obj = create(config)
            switch(config.isSimulation)
                case true
                    obj = CarWashSimulatorAdapter(config);
                otherwise
                    exception = MException('CarWashAdapterFactory:notImplemented','Real scenario not implemented.');
                    throw(exception);
            end
        end
    end
end

