load('C:\Users\Bear\Documents\MATLAB\MachineLearning\Homework4\d1.mat');
%train = svmtrain(X,Y, 'showplot',true);

mdl = ClassificationKNN.fit(X,Y);
%[label,score,cost] = predict(mdl,Xnew)
mdl.NumNeighbors = 10;
cvmodel = crossval(mdl);
kloss = kfoldLoss(cvmodel);

%E = kfoldEdge(cvmodel);	%Classification edge for observations not used for training
%F = kfoldfun(cvmodel);	%Cross validate function
%L = kfoldLoss(cvmodel);	%Classification loss for observations not used for training
%M = kfoldMargin(cvmodel);	%Classification margins for observations not used for training
%P = kfoldPredict(cvmodel); %