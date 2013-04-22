load('C:\Users\Bear\Documents\MATLAB\MachineLearning\Homework4\d1.mat');
%train = svmtrain(X,Y, 'showplot',true);

mdl = ClassificationKNN.fit(X,Y);
%[label,score,cost] = predict(mdl,Xnew)
cvmodel = crossval(mdl);