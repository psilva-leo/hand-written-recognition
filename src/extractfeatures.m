%
% EXTRACTFEATURES( digdata )
%
% Arguments: 'digdata' is a vector, size 256.
%
% Process the supplied vector to generate a lower dimensional
% feature vector, to be used in a learning algorithm.
%
% The returned vector is the sum of gaps in each of the 16 columns.
%
%
%
function dextracted = extractfeatures( data )
    
        gap = zeros(16,1);
        tmp = char(zeros(1,256));
        % Get vector 1x256 and change any number > 0 to '|' and every 0 to
        % ' '.
        for i = 1:256
            if(data(i) > 0 )
                tmp(i) = '|';
            else tmp(i) = ' ';
            end
        end
        % Transform the vector into a matrix 16x16 and rotate it to be
        % visualy equal to the number seem by showdigit.
        tmp = vec2mat(tmp,16);
        tmp = rot90(tmp,-1);
        tmp = fliplr(tmp);

        % A 'gap' is the difference of the black background to the white
        % ink. There fore, when there is a change of character there is a
        % gap.
        for i = 1:16
            for j = 2:16
                if(tmp(i,j) ~= tmp(i,j-1))
                    gap(i) = gap(i) + 1;
                end
            end
        end
        % As gap is a column the transpose of it is a row.
        gap = gap.';
        dextracted = gap;
end
