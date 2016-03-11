close all
clear all

%% PART 4 - PERCEPTRON
%% Training Perceptron
interactions = 20;
accPerceptron = zeros(1,interactions);
for in = 1:interactions
    [input output] = gatherdata2();

    samples = 200;
    bias = -1;
    coeff = 0.75;
    weights = -1*2.*rand(256+1,1);
    int = in;

    % Binary classifier - sigmoid function turns normalizes to 0-1
    % 3 = 0 and 8 = 1
    for i = 1:200
        if(output(i) == 3)
            output(i) = 0;
        else output(i) = 1;
        end
    end

    for i = 1:int
        out = zeros(samples,1);
        for j = 1:samples
            y = bias*weights(1,1);
            for b = 1:256
                y = y + input(j,b)*weights(b+1,1);
            end
            out(j) = 1/(1+exp(-y));
            delta = output(j)-out(j);
            weights(1,1) = weights(1,1)+coeff*bias*delta;
            for b = 1:256
                weights(b+1,1) = weights(b+1,1)+coeff*input(j,b)*delta;
            end
        end
    end

    %% Accuracy

    % gathering test data
    [testdata, testlabels] = gatherdata2();

    % 3 = 0 and 8 = 1
    for i = 1:200
        if(testlabels(i) == 3)
            testlabels(i) = 0;
        else testlabels(i) = 1;
        end
    end

    % Testing data
    for j = 1:samples
        y = bias*weights(1,1);
        for b = 1:256
            y = y + testdata(j,b)*weights(b+1,1);
        end
        out(j) = 1/(1+exp(-y));
    end


    % Accuracy calculation
    for i = 1:200
        if(testlabels(i) == out(i))
            accPerceptron(in) = accPerceptron(in)+1;
        end
    end
    
    accPerceptron(1,in) = accPerceptron(in)/200;
end

figure;
plot(1:interactions, accPerceptron,'b-o');
title('Perceptron Accuracy varying the number of interactions')
xlabel('interactions')
ylabel('accuracy')

av = sum(accPerceptron)/20