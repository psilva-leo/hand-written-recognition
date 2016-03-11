close all
clear all

%% PART 2 - Feature Extractors for Digit Recognition
%% Calculate 256 Features Score
% Test accuracy using k = 1 to k = 31.
[train256, trainlabels256] = gatherdata();
[test256, testlabels256] = gatherdata();
acc256 = accuracy(31, test256, testlabels256, train256, trainlabels256);
score256 = (acc256./256)*100;

%% Calculate 16 features scores
% Gather data to change number of features
% Training data
[train16, trainlabels16] = gatherdata();
dextracted = zeros(200,16);
for i = 1:200
    dextracted(i,:) = extractfeatures( train16(i,:) );
end

% Testing data
[test16, testlabels16] = gatherdata();
testextracted = zeros(200,16);
for i = 1:200
    testextracted(i,:) = extractfeatures( test16(i,:) );
end

acc16 = accuracy(31, testextracted, testlabels256, dextracted, trainlabels16);
score16 = (acc16./16)*100;

%% Plotting data
k = 1:31;
figure;
plot(k, score256,'b-o');
title('256 Featured Score varying k')
xlabel('k')
ylabel('score')
figure;
plot(k, score16,'r-x');
title('16 Featured Score varying k')
xlabel('k')
ylabel('score')

%% confusion Matrix
% Testing for k = 10
samples = 200;
predicted = zeros(1,200);
% 256 Features
for i = 1:samples
    predicted(i) = knearest(10, test256(i,:), train256, trainlabels256);
end
CM256 = confusionmatrix(trainlabels256, predicted, 200)

% 16 Features
for i = 1:samples
    predicted(i) = knearest(10, test16(i,:), train16, trainlabels16);
end
CM16 = confusionmatrix(trainlabels16, predicted, 200)

