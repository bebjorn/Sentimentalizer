function [ correctness ] = KNearestNeigborsCategories2(name1, name2, name3, name4, neighbors )

path = '../../data/output/';
matrix1 = textread(strcat(path,name1));
matrix2 = textread(strcat(path,name2));
matrix3 = textread(strcat(path,name3));
matrix4 = textread(strcat(path,name4));

Y = [ones(size(matrix1,1),1); ones(size(matrix2,1),1); ones(size(matrix3,1),1)*-1; ones(size(matrix4,1),1)*-1];
X = [matrix1;matrix2;matrix3;matrix4];
%X = X ~= 0;
mdl = ClassificationKNN.fit(X,Y);
%[label,score,cost] = predict(mdl,Xnew)
mdl.NumNeighbors = neighbors;
cvmodel = crossval(mdl);
kloss = kfoldLoss(cvmodel);

correctness = 1-kloss;
end

