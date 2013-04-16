function [ posMatrix, negMatrix ] = importData( )
%IMPORTDATA Summary of this function goes here
%   Detailed explanation goes here
matrix = fmatrix('books_neg');
max = findMax(matrix);
posMatrix = createMatrix(matrix, max);


matrix2 = fmatrix('books_pos');
max = findMax(matrix2);
negMatrix = createMatrix(matrix2, max);


end

