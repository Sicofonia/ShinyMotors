classdef CarWashUiNonFunctionalTests < matlab.uitest.TestCase & matlab.mock.TestCase
    % UI Tests for non-functional features of the ShinyMotors app

    properties
        App
    end

    methods
        function setUpCarWashApp(testCase)
            import matlab.mock.actions.AssignOutputs
            config.isSimulation = 1;
            config.screenTimeoutPeriodSecs = 120;
            tra = TicketRepositoryTestAdapter();
            [carWashAdapterMock,behavior] = testCase.createMock(?ICarWashAdapter);
            when(behavior.startWash(WashType.Quick), AssignOutputs(1));
            testCase.App = CarWashSimulatorApp(config, carWashAdapterMock, tra);
            testCase.addTeardown(@delete,testCase.App);
        end

        function setUpCarWashAppWithFaultyWaterPump(testCase)
            import matlab.mock.actions.AssignOutputs
            config.isSimulation = 1;
            config.screenTimeoutPeriodSecs = 120;
            tra = TicketRepositoryTestAdapter();
            [carWashAdapterMock,behavior] = ...
                testCase.createMock(?ICarWashAdapter);

            when(behavior.startWash(WashType.Quick), AssignOutputs(1));

            testCase.assignOutputsWhen(withAnyInputs(...
                behavior.getWaterPumpStatus),0);
            testCase.assignOutputsWhen(withAnyInputs(...
                behavior.getSoapLevel),100);
            testCase.assignOutputsWhen(withAnyInputs(...
                behavior.getWaxLevel),100);
            testCase.assignOutputsWhen(withAnyInputs(...
                behavior.getUltraShineLevel),100);

            testCase.App = CarWashSimulatorApp(config, carWashAdapterMock, tra);
            testCase.addTeardown(@delete,testCase.App);
        end
    end

    methods(Test)

        function enteringInvalidCodeWillInformTheUser(testCase)
            import matlab.lang.OnOffSwitchState
            setUpCarWashApp(testCase);
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);

            testCase.verifyEqual(testCase.App.ErrorMessageLabel.Visible, OnOffSwitchState.on);
            testCase.verifyTrue(strcmp(testCase.App.ErrorMessageLabel.Text, ...
                TicketValidationMessages.TicketDoesNotExit));
            testCase.verifyTrue(isempty(testCase.App.EnteredCodeLabel.Text));
        end

        function enteringExpiredCodeWillInformTheUser(testCase)
            import matlab.lang.OnOffSwitchState
            setUpCarWashApp(testCase);
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_2);

            testCase.verifyEqual(testCase.App.ErrorMessageLabel.Visible, OnOffSwitchState.on);
            testCase.verifyTrue(strcmp(testCase.App.ErrorMessageLabel.Text, ...
                TicketValidationMessages.ExpiredTicket));
            testCase.verifyTrue(isempty(testCase.App.EnteredCodeLabel.Text));
        end

        % SCENARIO: User enters valid code for a car wash but water pump
        % is not working.
        function whenCarWashIsFaultyWillInformTheUser(testCase)           
            import matlab.lang.OnOffSwitchState
            setUpCarWashAppWithFaultyWaterPump(testCase);
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_1);
            testCase.press(testCase.App.Button_2);
            testCase.press(testCase.App.Button_3);
            testCase.press(testCase.App.Button_4);
            testCase.press(testCase.App.Button_5);
            testCase.press(testCase.App.Button_6);

            testCase.verifyEqual(testCase.App.ErrorMessageLabel.Visible, OnOffSwitchState.on);
            testCase.verifyTrue(contains(testCase.App.ErrorMessageLabel.Text, ...
                "cannot start now"));
            testCase.verifyTrue(isempty(testCase.App.EnteredCodeLabel.Text));
        end

        % SCENARIO: User selects pay with card and enters wrong PIN
        function whenPINNumberIsWrongWillInformUser(testCase)           
            import matlab.lang.OnOffSwitchState
            setUpCarWashAppWithFaultyWaterPump(testCase);
            testCase.press(testCase.App.PayWithCardButton);

            testCase.press(testCase.App.Button_1);
            testCase.press(testCase.App.Button_2);
            testCase.press(testCase.App.Button_3);
            testCase.press(testCase.App.Button_4);

            testCase.verifyEqual(testCase.App.ErrorMessageLabel.Visible, OnOffSwitchState.on);
            testCase.verifyTrue(contains(testCase.App.ErrorMessageLabel.Text, ...
                "Wrong PIN"));
            testCase.verifyTrue(isempty(testCase.App.EnteredCodeLabel.Text));
        end
    end
end