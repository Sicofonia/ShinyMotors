classdef CarWashAppSimulatorIntegrationTests < matlab.uitest.TestCase
    % Integration Tests for ShinyMotors app and car wash simulator

    properties
        App
    end

    methods(TestMethodSetup)
        function instantiateApp(testCase)
            config.isSimulation = 1;
            config.screenTimeoutPeriodSecs = 120;
            config.WaterPumpStatus = 1;
            config.SoapLevel = 100;
            config.WaxLevel = 15;
            config.UltraShineLevel = 100;
            testCase.App = CarWashSimulatorApp(config,struct([]),struct([]));
        end
    end

     methods(TestMethodTeardown)
        function closeApp(testCase)
            testCase.addTeardown(@delete,testCase.App);
            close_system;
        end
    end

    methods(Test)
        % Test methods
        function enteringAValidQuickWashCodeTriggersWashSimulator(testCase)           
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_1);
            testCase.press(testCase.App.Button_2);
            testCase.press(testCase.App.Button_3);
            testCase.press(testCase.App.Button_4);
            testCase.press(testCase.App.Button_5);
            testCase.press(testCase.App.Button_6);
        end

        function enteringAValidStandardWashCodeTriggersWashSimulator(testCase)           
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_1);
            testCase.press(testCase.App.Button_2);
            testCase.press(testCase.App.Button_3);
            testCase.press(testCase.App.Button_4);
            testCase.press(testCase.App.Button_5);
            testCase.press(testCase.App.Button_7);
        end

        function enteringAValidPremiumWashCodeTriggersWashSimulator(testCase)           
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_1);
            testCase.press(testCase.App.Button_2);
            testCase.press(testCase.App.Button_3);
            testCase.press(testCase.App.Button_4);
            testCase.press(testCase.App.Button_5);
            testCase.press(testCase.App.Button_8);
        end

        function enteringAValidUltimateWashCodeTriggersWashSimulator(testCase)           
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_1);
            testCase.press(testCase.App.Button_2);
            testCase.press(testCase.App.Button_3);
            testCase.press(testCase.App.Button_4);
            testCase.press(testCase.App.Button_5);
            testCase.press(testCase.App.Button_9);
        end
    end 
end