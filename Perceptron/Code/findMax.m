function [ max ] = findMax( matrix )
%FINDMAX Summary of this function goes here
%   Detailed explanation goes here
    max = 0;
    for i = 1 : size(matrix, 2),
        cell = matrix(i);
        for j = cell{:}.id
            if j > max,
                max = j;
            end
        end
    end
end

