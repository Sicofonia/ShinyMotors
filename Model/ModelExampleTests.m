classdef ModelExampleTests < matlab.unittest.TestCase
    
    methods(TestClassSetup)
        % Shared setup for the entire test class
    end
    
    methods(TestMethodSetup)
        % Setup for each test
    end
    
    methods(Test)
        % Test methods
        
        function unimplementedTest(testCase)
            expectedResult = "Hello World";
            testCase.verifyEqual(ModelExample.test(),expectedResult);
        end
    end
    
end