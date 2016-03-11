% The function gathers data from postaldata and returns the matrix and the
% labels. It uses the '3' and '8' digits.
function [D, labels] = gatherdata2()
    load postaldata

    %% Gathering data to analyse
    D = zeros(200,256);
    labels = zeros(200,1);
    r = randi([1001, 4000],1,1500);
    count = 0;
    loop = 0;

    while(count < 200)
        if((r(loop+1) > 1000 && r(loop+1) < 1501))
            D(count+1,:) = data(r(loop+1),:);
            labels(count+1) = 3;
            count = count + 1;
        elseif (r(loop+1) > 3500 && r(loop+1) < 4001)
            D(count+1,:) = data(r(loop+1),:);
            labels(count+1) = 8;
            count = count + 1;
        end 
        loop = loop+1;
    end
end