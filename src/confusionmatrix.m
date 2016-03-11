% Size is the number of elements in the vector.
% Return the confuion matrix 3x3
function CM = confusionmatrix(trueLabels, testLabels, size)

% Confusion matrix
CM = zeros(3,3);

for i=1:size
    actual = trueLabels(i);
    predicted = testLabels(i);
   
    if(actual == 3)
        if(predicted == 3)
            CM(1,1) = CM(1,1)+1;
        elseif(predicted == 6)
            CM(1,2) = CM(1,2)+1;
        elseif(predicted == 8)
            CM(1,3) = CM(1,3)+1;
        end
    elseif(actual == 6)
        if(predicted == 3)
            CM(2,1) = CM(2,1)+1;
        elseif(predicted == 6)
            CM(2,2) = CM(2,2)+1;
        elseif(predicted == 8)
            CM(2,3) = CM(2,3)+1;
        end
    elseif(actual == 8)
        if(predicted == 3)
            CM(3,1) = CM(3,1)+1;
        elseif(predicted == 6)
            CM(3,2) = CM(3,2)+1;
        elseif(predicted == 8)
            CM(3,3) = CM(3,3)+1;
        end
    end
end

end