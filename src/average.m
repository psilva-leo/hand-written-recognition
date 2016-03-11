function averageTotal = average(x)
    averageTotal = zeros(31,1);
    if(x == 0)
        for i = 1:10
            [trainingData trainingLabels] = gatherdata(); 
           avg = accuracy(31, trainingData, trainingLabels, trainingData, trainingLabels);
           hold on
           averageTotal = averageTotal + avg;
        end
    elseif(x == 1)
        [trainingData trainingLabels] = gatherdata();
        for i = 1:10
            [testingData testingLabels] = gatherdata(); 
           avg = accuracy(31, testingData, testingLabels, trainingData, trainingLabels);
           hold on
           averageTotal = averageTotal + avg;
        end
    else
        error('Invalid argument. 0 for training aor 1 for testing');
    end
    averageTotal = averageTotal./10;
end