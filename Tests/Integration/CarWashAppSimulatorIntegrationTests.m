classdef CarWashAppSimulatorIntegrationTests < matlab.uitest.TestCase
    % Integration Tests for ShinyMotors app and car wash simulator

    properties
        App
    end

    methods(TestMethodSetup)
        function instantiateApp(testCase)
            testCase.App = CarWashSimulatorApp(1,struct([]),struct([]));
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
        function enteringAValid6DigitsCodeTriggersWashSimulator(testCase)           
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_1);
            testCase.press(testCase.App.Button_2);
            testCase.press(testCase.App.Button_3);
            testCase.press(testCase.App.Button_4);
            testCase.press(testCase.App.Button_5);
            testCase.press(testCase.App.Button_6);
        end
    end 
end