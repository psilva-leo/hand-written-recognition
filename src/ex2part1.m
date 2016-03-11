clear all;
close all;

%% PART 1 - TRAINING AND TESTING
%% Gathering data
[D myLabels] = gatherdata();

%% Verifing the accuracy using the KNN algorithm
k = 1:31;
acc = accuracy(31, D, myLabels, D, myLabels);
figure;
p1 = plot(k, acc,'-o');
title('Training Accuracy varying k')
xlabel('k')
ylabel('accuracy')


%% Gathering another 200 data
[D2 myLabels2] = gatherdata();

%% Verifing the accuracy using KNN for the testing data
acc = accuracy(31, D2, myLabels2, D, myLabels);
figure;
p2 = plot(k, acc,'r-x');
title('Testing Accuracy varying k')
xlabel('k')
ylabel('accuracy')

%% Calculating Average for training and testing
figure;
averageTraining = average(0);
e = std(averageTraining)*ones(size(averageTraining));
p4 = errorbar(averageTraining, e);
title('Training Average Accuracy varying k')
xlabel('k')
ylabel('accuracy')

figure;
averageTesting = average(1);
e = std(averageTesting)*ones(size(averageTesting));
p5 = errorbar(averageTesting, e, 'r-x');
title('Testing Average Accuracy varying k')
xlabel('k')
ylabel('accuracy')
