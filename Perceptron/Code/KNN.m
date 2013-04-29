%load('C:\Users\Bear\Documents\MATLAB\MachineLearning\Homework4\d1.mat');
%train = svmtrain(X,Y, 'showplot',true);

%mdl = ClassificationKNN.fit(X,Y);
%[label,score,cost] = predict(mdl,Xnew)
%mdl.NumNeighbors = 10;
%cvmodel = crossval(mdl);
%kloss = kfoldLoss(cvmodel);

%E = kfoldEdge(cvmodel);	%Classification edge for observations not used for training
%F = kfoldfun(cvmodel);	%Cross validate function
%L = kfoldLoss(cvmodel);	%Classification loss for observations not used for training
%M = kfoldMargin(cvmodel);	%Classification margins for observations not used for training
%P = kfoldPredict(cvmodel); %


name1 = 'camera_pos';
name2 = 'camera_neg';
name3 = 'health_pos';
name4 = 'health_neg';
neighbors = 5;

path = '../../data/output/';
matrix1 = textread(strcat(path,name1));
matrix2 = textread(strcat(path,name2));
matrix3 = textread(strcat(path,name3));
matrix4 = textread(strcat(path,name4));

Y = [ones(size(matrix1,1),1); ones(size(matrix2,1),1); ones(size(matrix3,1),1)*2; ones(size(matrix4,1),1)*2];
X = [matrix1;matrix2;matrix3;matrix4];

load fisheriris
indices = crossvalind('Kfold',Y,10);
cp = classperf(Y); % initializes the CP object
for i = 1:10
    test = (indices == i); train = ~test;
    class = knnclassify(X(test,:),X(train,:),Y(train));
    % updates the CP object with the current classification results
    classperf(cp,class,test); 
    cp.LastCorrectRate
end
cp.CorrectRate % queries for the correct classification rate


