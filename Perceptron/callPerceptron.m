function [ w ] = callPerceptron( matrix1, matrix2 )
%CATEGORIZATION Summary of this function goes here
%   Detailed explanation goes here
X = [matrix1; matrix2];
Y = [ones(size(matrix1,1),1); ones(size(matrix2,1),1)*-1];
w = perceptron(X, Y);
end

