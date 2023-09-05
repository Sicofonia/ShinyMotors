# ShinyMotors
Experimental project to showcase some modelling techniques and iterative
object oriented analysis and design using MATLAB Stateflow.

## Docs
It contains the fictional brief for the exercise.

## Model
This folder contains the different classes that are part of the domain
layer design.

## Tests
There are three types of tests, namely Integration (a tests that runs the
App along with the simulator), UI (it only tests the UI of the app, using
mocks as explained in [here](https://uk.mathworks.com/help/matlab/matlab_prog/write-tests-that-use-app-testing-and-mocking-frameworks.html)),
and Unit tests (for testing individual classes).
Prior running the tests, ensure that the project folder has been added to MATLAB's path. You can do this by opening up the dialog from "Home -> Set Path" tab. See this [link](https://uk.mathworks.com/help/matlab/matlab_prog/resolve-error-undefined-function-or-variable.html) for more info.
To run all tests execute the command `TestRunner.runAll()`.
(Ensure you have the root, Model and Tests folders added to the MATLAB path
variable for tests to run successfully).

## Execution
Run the script `runApp` from the command window in MATLAB to run the simulation.
Also, simulation settings can be changed inside `runApp.m` to experiment
with different use cases.
