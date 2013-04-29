function [ correctness ] = kNearestNeighbour(name1, name2, neighbors)
%CROSSVALIDATION Summary of this function goes here
%   Detailed explanation goes here
path = '../../data/tfidf/';
matrix1 = textread(strcat(path,name1));
matrix2 = textread(strcat(path,name2));

%matrix1 = matrix1 ~= 0;
%matrix2 = matrix2 ~= 0;

Y = [ones(size(matrix1,1),1); ones(size(matrix2,1),1)*-1];
X = [matrix1;matrix2];

mdl = ClassificationKNN.fit(X,Y);
%[label,score,cost] = predict(mdl,Xnew)
mdl.NumNeighbors = neighbors;
cvmodel = crossval(mdl);
kloss = kfoldLoss(cvmodel);

correctness = 1-kloss;
end

