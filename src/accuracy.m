% numK is the range of k to test eg. numK = 3 will test for k = 1,2 and 3.
% test is the test data
% truelabelsTest is the labels of the test data
% data is the training data
% truelabels is the labels of the training data
% acc is a numK size vector containing the accuracy using k neighbors.
function acc = accuracy(numK, test, truelabelsTest, data, truelabels)
    examples = 200;
    acc = zeros(numK,1);
    for k=1:numK
        for i = 1:examples
            Y = knearest(k, test(i,:), data, truelabels);
            if Y == truelabelsTest(i)
                acc(k) = acc(k) + 1;
            end
        end
        acc(k) = acc(k)/examples;
    end
end
