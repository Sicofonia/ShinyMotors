classdef TestRunner
    %TestRunner Helper static class to run all tests included in project.
    %   It will run unit, UI and integration tests and output the result
    %   to the console.

    properties(Constant)
        uiTestsPath = './Tests/UI/';
        integrationTestsPath = './Tests/Integration/';
        unitTestsPath = './Tests/Unit/';
    end

    methods(Access = private)
        function count = calculatePassCount(testResult)
            count = 0;
            for i=1:length(unitResults)
                count = count + testResult(i).Passed;
            end
        end

        function count = calculateFailedCount(testResult)
            count = 0;
            for i=1:length(unitResults)
                count = count + testResult(i).Failed;
            end
        end

        function printTestsResults(~,passCount, failedCount)
            fprintf('--------------------\n');
            fprintf('- TEST RUN RESULTS -\n');
            fprintf('--------------------\n');
            fprintf('Passed: %n \n', passCount);
            fprintf('Failed: %n \n', failedCount);
        end
    end

    methods(Static)
        function runAll()
            unitResults = runtests(TestRunner.unitTestsPath);
            uiResults = runtests(TestRunner.uiTestsPath);
            integrationResults = runtests(TestRunner.integrationTestsPath);
            
            passCount = 0;
            for i=1:length(unitResults)
                passCount = passCount + unitResults(i).Passed;
            end
            for i=1:length(uiResults)
                passCount = passCount + uiResults(i).Passed;
            end
            for i=1:length(integrationResults)
                passCount = passCount + integrationResults(i).Passed;
            end

            failedCount = 0;
            for i=1:length(unitResults)
                failedCount = failedCount + unitResults(i).Failed;
            end
            for i=1:length(uiResults)
                failedCount = failedCount + uiResults(i).Failed;
            end
            for i=1:length(integrationResults)
                failedCount = failedCount + integrationResults(i).Failed;
            end
            
            fprintf('--------------------\n');
            fprintf('- TEST RUN RESULTS -\n');
            fprintf('--------------------\n');
            fprintf('Passed: %d \n', passCount);
            fprintf('Failed: %d \n', failedCount);
        end
    end
end