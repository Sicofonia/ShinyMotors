% Set up test configuration
emptyObject = struct([]);
config.isSimulation = 1;
config.screenTimeoutPeriodSecs = 120;
config.WaterPumpStatus = 1;
config.SoapLevel = 100;
config.WaxLevel = 100;
config.UltraShineLevel = 100;

% run app
CarWashSimulatorApp(config, emptyObject, emptyObject);