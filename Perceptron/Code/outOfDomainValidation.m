function [ correctness ] = outOfDomainValidation(testPos, testNeg, learnPos, learnNeg, folds)
%CROSSVALIDATION Summary of this function goes here
%   Detailed explanation goes here
path = '../../data/output/';
matrix1 = textread(strcat(path,learnPos));
matrix2 = textread(strcat(path,learnNeg));

testMatrix1 = textread(strcat(path,testPos));
testMatrix2 = textread(strcat(path,testNeg));

m1Length = size(matrix1,1);
testLength = m1Length/folds;
trainLength = m1Length-testLength;

matrix1 = [matrix1,ones(m1Length,1)];
matrix2 = [matrix2,ones(m1Length,1)];

testMatrix1 = [testMatrix1,ones(m1Length,1)];
testMatrix2 = [testMatrix2,ones(m1Length,1)];

learnMatrix = [ones(trainLength); ones(trainLength)*-1];
testMatrix = [ones(testLength); ones(testLength)*-1];
count = 0;

for k = 1:testLength:trainLength
    a = [matrix1([1:1:k-1, k+testLength:1:m1Length],:);matrix2([1:1:k-1, k+testLength:1:m1Length], :)];
    test = [testMatrix1([k:1:k+testLength],:);testMatrix2([k:1:k+testLength], :)];
    w = perceptron(a,learnMatrix, 100);
    for i = 1 : testLength*2,
        if sign(w' * test(i,:)') == testMatrix(i)  % y(i) x(i) check correct
            count = count + 1;
        end
    end
end
avarage = count/folds;
correctness = avarage/(testLength*2);
end

