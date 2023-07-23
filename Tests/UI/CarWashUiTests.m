classdef CarWashUiTests < matlab.uitest.TestCase & matlab.mock.TestCase
    % UI Tests for the ShinyMotors app functional requirements around
    % entering codes and paying with credit card

    properties
        App
        Behaviour
    end

    methods(TestMethodSetup)
        function instantiateApp(testCase)
            import matlab.mock.actions.AssignOutputs
            config.isSimulation = 1;
            config.screenTimeoutPeriodSecs = 120;
            config.WaterPumpStatus = 1;
            config.SoapLevel = 100;
            config.WaxLevel = 15;
            config.UltraShineLevel = 100;
            tra = TicketRepositoryTestAdapter();
            [carWashAdapterMock,behavior] = testCase.createMock(?ICarWashAdapter);
            testCase.assignOutputsWhen(withAnyInputs(behavior.startWash),1);
            testCase.assignOutputsWhen(withAnyInputs(behavior.getWaterPumpStatus),1);
            testCase.assignOutputsWhen(withAnyInputs(behavior.getSoapLevel),100);
            testCase.assignOutputsWhen(withAnyInputs(behavior.getWaxLevel),100);
            testCase.assignOutputsWhen(withAnyInputs(behavior.getUltraShineLevel),100);
            testCase.Behaviour = behavior;
            testCase.App = CarWashSimulatorApp(config, carWashAdapterMock, tra);
        end
    end

     methods(TestMethodTeardown)
        function closeApp(testCase)
            testCase.addTeardown(@delete,testCase.App);
        end
     end

    methods(Test)
        function canSelectEnterCodeOperation(testCase)           
            testCase.press(testCase.App.EnterCodeButton);
        
            testCase.verifyTrue(testCase.App.EnterCodePanel.Visible);
            testCase.verifyEqual(testCase.App.EnterCodePanel.Enable, 'on');
        end

        function enteringAValid6DigitsCodeTriggersWash(testCase)
            import matlab.lang.OnOffSwitchState
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_1);
            testCase.press(testCase.App.Button_2);
            testCase.press(testCase.App.Button_3);
            testCase.press(testCase.App.Button_4);
            testCase.press(testCase.App.Button_5);
            testCase.press(testCase.App.Button_6);
            
            testCase.verifyEqual(testCase.App.ProceedPanel.Visible, OnOffSwitchState.off);
            testCase.verifyEqual(testCase.App.EnterCodeButton.Visible, OnOffSwitchState.on);
        end

        function enteringInvalidCodeWontTriggerAnything(testCase)           
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);

            testCase.verifyEqual(testCase.App.EnteredCodeLabel.Text, '');
            testCase.verifyTrue(testCase.App.EnterCodePanel.Visible);
        end

        function pressingClearWillClearOutCode(testCase)           
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_1);
            testCase.press(testCase.App.Button_2);
            testCase.press(testCase.App.Button_3);
            testCase.press(testCase.App.Button_4);
            testCase.press(testCase.App.Button_5);
            testCase.press(testCase.App.ClearButton);

            testCase.verifyTrue(isempty(testCase.App.EnteredCodeLabel.Text));
        end

        function pressingCancelWillBringBackSelectOperationScreen(testCase)           
            import matlab.lang.OnOffSwitchState
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.CancelButton);

            testCase.verifyEqual(testCase.App.EnterCodePanel.Visible, OnOffSwitchState.off);
            testCase.verifyEqual(testCase.App.EnterCodeButton.Visible, OnOffSwitchState.on);
        end

        % SCENARIO: User enters code and half way thru cancels out. Coming
        % back to enter code screen should show an empty code text box
        function afterCancellingEnteredCodeLabelIsClearedOut(testCase)           
            testCase.press(testCase.App.EnterCodeButton);
            testCase.press(testCase.App.Button_1);
            testCase.press(testCase.App.Button_2);
            testCase.press(testCase.App.CancelButton);
            testCase.press(testCase.App.EnterCodeButton);

            testCase.verifyTrue(isempty(testCase.App.EnteredCodeLabel.Text));
        end

        % SCENARIO: Can pay with card a Quick Wash program
        function payWithCardAQuickWashProgram(testCase)           
            import matlab.lang.OnOffSwitchState
            testCase.press(testCase.App.PayWithCardButton);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.FirstProgramButton);

            testCase.verifyEqual(testCase.App.ProceedPanel.Visible, OnOffSwitchState.off);
            testCase.verifyEqual(testCase.App.EnterCodeButton.Visible, OnOffSwitchState.on);
        end

        % SCENARIO: Can pay with card a Standard Wash program
        function payWithCardAStandardWashProgram(testCase)           
            import matlab.lang.OnOffSwitchState
            testCase.press(testCase.App.PayWithCardButton);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.SecondProgramButton);

            testCase.verifyEqual(testCase.App.ProceedPanel.Visible, OnOffSwitchState.off);
            testCase.verifyEqual(testCase.App.EnterCodeButton.Visible, OnOffSwitchState.on);
        end

        % SCENARIO: Can pay with card a Premium Wash program
        function payWithCardAPremiumWashProgram(testCase)           
            import matlab.lang.OnOffSwitchState
            testCase.press(testCase.App.PayWithCardButton);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.ThirdProgramButton);

            testCase.verifyEqual(testCase.App.ProceedPanel.Visible, OnOffSwitchState.off);
            testCase.verifyEqual(testCase.App.EnterCodeButton.Visible, OnOffSwitchState.on);
        end

        % SCENARIO: Can pay with card a Ultimate Wash program
        function payWithCardAUltimateWashProgram(testCase)           
            import matlab.lang.OnOffSwitchState
            testCase.press(testCase.App.PayWithCardButton);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.FourthProgramButton);

            testCase.verifyEqual(testCase.App.ProceedPanel.Visible, OnOffSwitchState.off);
            testCase.verifyEqual(testCase.App.EnterCodeButton.Visible, OnOffSwitchState.on);
        end
    end
end