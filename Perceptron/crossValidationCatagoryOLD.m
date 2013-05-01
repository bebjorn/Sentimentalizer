function [ y ] = crossValidationCatagory(folds )
    path = '../../data/output/';
    matrix1 = textread(strcat(path,name1));
    matrix2 = textread(strcat(path,name2));

    m1Length = size(matrix1,1); 
    testLength = m1Length/folds;
    trainLength = m1Length-testLength;
    
    matrix1 = [matrix1,ones(m1Length,1)];
    matrix2 = [matrix2,ones(m1Length,1)];

    testMatrix = [ones(testLength); ones(testLength)*-1];
    count = 0;
    
    
    w = callPerceptron(matrix1(1:1:trainLength), matrix2(1:1:trainLength));
    
    y = catagorization(w, matrix1(m1Length-1));
    
end
