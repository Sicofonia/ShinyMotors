classdef CarWashUiNonFunctionalTimeoutTests < matlab.uitest.TestCase & matlab.mock.TestCase
    % UI Tests for the ShinyMotors app

    properties
        App
    end

    methods(TestMethodSetup)
        function instantiateApp(testCase)
            import matlab.mock.actions.AssignOutputs
            config.isSimulation = 1;
            config.screenTimeoutPeriodSecs = 0.001;
            tra = TicketRepositoryTestAdapter();
            [carWashAdapterMock,behavior] = testCase.createMock(?ICarWashAdapter);
            when(behavior.startWash(WashTypes.Quick), AssignOutputs(1));
            testCase.App = CarWashSimulatorApp(config, carWashAdapterMock, tra);
        end
    end

    methods(TestMethodTeardown)
        function closeApp(testCase)
            testCase.addTeardown(@delete,testCase.App);
        end
    end

    methods(Test)

        function enteringCodeTimesOutWhenCodeNotEnteredOnTime(testCase)
            import matlab.lang.OnOffSwitchState
            testCase.press(testCase.App.EnterCodeButton);
            pause(0.5);
            testCase.verifyEqual(testCase.App.EnterCodePanel.Visible, OnOffSwitchState.off);
        end

    end
end