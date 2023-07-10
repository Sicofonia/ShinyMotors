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
To run all tests execute the command `TestRunner.runAll()`.

## Execution
Run the script `runApp` from the command window in MATLAB to run the simulation.
Also, simulation settings can be changed inside `runApp.m` to experiment
with different use cases.
