classdef CarWashUiTests < matlab.uitest.TestCase & matlab.mock.TestCase
    % UI Tests for the ShinyMotors app

    properties
        App
    end

    methods(TestMethodSetup)
        function instantiateApp(testCase)
            import matlab.mock.actions.AssignOutputs
            tra = TicketRepositoryTestAdapter();
            [carWashAdapterMock,behavior] = testCase.createMock(?ICarWashAdapter);
            when(behavior.startWash(Wash_Types.Quick), AssignOutputs(1));
            testCase.App = CarWashSimulatorApp(1, carWashAdapterMock, tra);
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
            testCase.verifyTrue(testCase.App.EnterCodePanel.Enable);
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

        function cannotEnterMoreThan6DigitsCode(testCase)           
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_9);
            testCase.press(testCase.App.Button_8);
            testCase.press(testCase.App.Button_7);
            testCase.press(testCase.App.Button_6);
            testCase.press(testCase.App.Button_5);
            testCase.press(testCase.App.Button_4);
            testCase.press(testCase.App.Button_3);
            testCase.press(testCase.App.Button_2);
            testCase.press(testCase.App.Button_1);

            testCase.verifyEqual(testCase.App.EnteredCodeLabel.Text, '987654');
        end

        function enteringInvalidCodeWontTriggerAnything(testCase)           
            testCase.press(testCase.App.EnterCodeButton);

            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);
            testCase.press(testCase.App.Button_0);

            testCase.verifyEqual(testCase.App.EnteredCodeLabel.Text, '000000');
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
    end
end