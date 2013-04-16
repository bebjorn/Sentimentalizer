function [ result, cnts, ids, cell, j] = createMatrix( matrix, max )
    result = zeros(size(matrix, 2), max);
    for i = 1 : size(matrix, 2),
        cell = matrix(i);
        ids = cell{:}.id;
        cnts = cell{:}.cnt;
        for j = 1 : size(ids, 2)
            result(i, ids(j)+1) = cnts(j);
        end
    end
end

