function [ correctness, count ] = crossValidationCategory(folds)

path = '../../data/tfidf/'; % or use the frequency directory

mBooks = [textread(strcat(path,'books_neg'));textread(strcat(path,'books_pos'))];
mCamera = [textread(strcat(path,'camera_neg'));textread(strcat(path,'camera_pos'))];
mDvd = [textread(strcat(path,'dvd_neg'));textread(strcat(path,'dvd_pos'))];
mHealth = [textread(strcat(path,'health_neg'));textread(strcat(path,'health_pos'))];
mMusic = [textread(strcat(path,'music_neg'));textread(strcat(path,'music_pos'))];
mSoftware = [textread(strcat(path,'software_neg'));textread(strcat(path,'software_pos'))];

% uncomment for binary feature
%mBooks = mBooks ~= 0;
%mCamera = mCamera ~= 0;
%mDvd = mDvd ~= 0;
%mHealth = mHealth ~= 0;
%mMusic = mMusic ~= 0;
%mSoftware = mSoftware ~= 0;

m1Length = 1800;
testLength = m1Length/folds;
trainLength = m1Length-testLength;

mBooks = [mBooks, ones(size(mBooks, 1),1)];
mCamera = [mCamera, ones(size(mCamera, 1),1)];
mDvd = [mDvd, ones(size(mDvd, 1),1)];
mHealth = [mHealth, ones(size(mHealth, 1),1)];
mMusic = [mMusic, ones(size(mMusic, 1),1)];
mSoftware = [mSoftware, ones(size(mSoftware, 1),1)];



learnMatrix = [ones(trainLength); ones(trainLength)*-1];
%testMatrix = [ones(testLength); ones(testLength)*-1];
count = zeros(6,6);
w = zeros(15,size(mBooks, 2));
%a = zeros(1900*2-(testLength*2),size(mBooks, 2));
for k = 1:testLength:trainLength,
    for i = 1:1:15,
        switch i
           case 1
              a = [mBooks([1:1:k-1, k+testLength:1:m1Length],:);mDvd([1:1:k-1, k+testLength:1:m1Length], :)];
           case 2
              a = [mBooks([1:1:k-1, k+testLength:1:m1Length],:);mCamera([1:1:k-1, k+testLength:1:m1Length], :)];
           case 3
              a = [mBooks([1:1:k-1, k+testLength:1:m1Length],:);mMusic([1:1:k-1, k+testLength:1:m1Length], :)];
           case 4
              a = [mBooks([1:1:k-1, k+testLength:1:m1Length],:);mHealth([1:1:k-1, k+testLength:1:m1Length], :)];
           case 5
              a = [mBooks([1:1:k-1, k+testLength:1:m1Length],:);mSoftware([1:1:k-1, k+testLength:1:m1Length], :)];
           case 6
              a = [mDvd([1:1:k-1, k+testLength:1:m1Length],:);mCamera([1:1:k-1, k+testLength:1:m1Length], :)];
           case 7
              a = [mDvd([1:1:k-1, k+testLength:1:m1Length],:);mMusic([1:1:k-1, k+testLength:1:m1Length], :)];
           case 8
              a = [mDvd([1:1:k-1, k+testLength:1:m1Length],:);mHealth([1:1:k-1, k+testLength:1:m1Length], :)];
           case 9
              a = [mDvd([1:1:k-1, k+testLength:1:m1Length],:);mSoftware([1:1:k-1, k+testLength:1:m1Length], :)];
           case 10
              a = [mCamera([1:1:k-1, k+testLength:1:m1Length],:);mMusic([1:1:k-1, k+testLength:1:m1Length], :)];
           case 11
              a = [mCamera([1:1:k-1, k+testLength:1:m1Length],:);mHealth([1:1:k-1, k+testLength:1:m1Length], :)];
           case 12
              a = [mCamera([1:1:k-1, k+testLength:1:m1Length],:);mSoftware([1:1:k-1, k+testLength:1:m1Length], :)];
           case 13
              a = [mMusic([1:1:k-1, k+testLength:1:m1Length],:);mHealth([1:1:k-1, k+testLength:1:m1Length], :)];
           case 14
              a = [mMusic([1:1:k-1, k+testLength:1:m1Length],:);mSoftware([1:1:k-1, k+testLength:1:m1Length], :)];
           case 15
              a = [mHealth([1:1:k-1, k+testLength:1:m1Length],:);mSoftware([1:1:k-1, k+testLength:1:m1Length], :)];
            otherwise
        end
        w(i,:) = perceptron(a,learnMatrix, 50);
        %w(i,:) = avaragedPerceptron(a,learnMatrix, 50);
        i
    end
    
    %;matrix2([k:1:k+testLength], :)];
    for type = 1:6,
        switch (type)
            case 1
              testData = mBooks([k:1:k+testLength],:);
           case 2
               testData = mDvd([k:1:k+testLength],:);
           case 3
               testData = mCamera([k:1:k+testLength],:);
           case 4
               testData = mMusic([k:1:k+testLength],:);
           case 5
               testData = mHealth([k:1:k+testLength],:);
           case 6
               testData = mSoftware([k:1:k+testLength],:);
        end
        
        for i = 1 : testLength,
            if sign(w(1,:) * testData(i,:)') == 1 % Book vs Dvd
                if sign(w(2,:) * testData(i,:)') == 1 % Book vs Camera
                    if sign(w(3,:) * testData(i,:)') == 1 % Book vs Music
                        if sign(w(4,:) * testData(i,:)') == 1 % Book vs Health
                            if sign(w(5,:) * testData(i,:)') == 1 % Book vs Software
                                count(type, 1) = count(type, 1) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        else
                            if sign(w(15,:) * testData(i,:)') == 1 % Health vs Software
                                count(type, 5) = count(type, 5) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        end
                    else 
                        if sign(w(13,:) * testData(i,:)') == 1 % Music vs Health
                            if sign(w(14,:) * testData(i,:)') == 1 % Music vs Software
                                count(type, 4) = count(type, 4) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        else
                            if sign(w(15,:) * testData(i,:)') == 1 % Health vs Software
                                count(type, 5) = count(type, 5) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        end
                    end
                else
                    if sign(w(10,:) * testData(i,:)') == 1 % Camera vs Music
                        if sign(w(11,:) * testData(i,:)') == 1 % Camera vs Health
                            if sign(w(12,:) * testData(i,:)') == 1 % Camera vs Software
                                count(type, 3) = count(type, 3) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        else
                            if sign(w(15,:) * testData(i,:)') == 1 % Health vs Software
                                count(type, 5) = count(type, 5) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        end
                    else
                        if sign(w(13,:) * testData(i,:)') == 1 % Music vs Health
                            if sign(w(14,:) * testData(i,:)') == 1 % Music vs Software
                                count(type, 4) = count(type, 4) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        else
                            if sign(w(15,:) * testData(i,:)') == 1 % Health vs Software
                                count(type, 5) = count(type, 5) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        end
                    end
                end
            else
                if sign(w(6,:) * testData(i,:)') == 1 % Dvd vs Camera
                    if sign(w(7,:) * testData(i,:)') == 1 % Dvd vs Music
                        if sign(w(8,:) * testData(i,:)') == 1 % Dvd vs Health
                            if sign(w(9,:) * testData(i,:)') == 1 % Dvd vs Software
                                count(type, 2) = count(type, 2) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        else
                            if sign(w(15,:) * testData(i,:)') == 1 % Health vs Software
                                count(type, 5) = count(type, 5) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        end
                    else
                        if sign(w(13,:) * testData(i,:)') == 1 % Music vs Health
                            if sign(w(14,:) * testData(i,:)') == 1 % Music vs Software
                                count(type, 4) = count(type, 4) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        else
                            if sign(w(15,:) * testData(i,:)') == 1 % Health vs Software
                                count(type, 5) = count(type, 5) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        end
                    end
                else
                    if sign(w(10,:) * testData(i,:)') == 1 % Camera vs Music
                        if sign(w(11,:) * testData(i,:)') == 1 % Camera vs Health
                            if sign(w(12,:) * testData(i,:)') == 1 % Camera vs Software
                                count(type, 3) = count(type, 3) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        else
                            if sign(w(15,:) * testData(i,:)') == 1 % Health vs Software
                                count(type, 5) = count(type, 5) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        end
                    else
                        if sign(w(13,:) * testData(i,:)') == 1 % Music vs Health
                            if sign(w(14,:) * testData(i,:)') == 1 % Music vs Software
                                count(type, 4) = count(type, 4) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        else
                            if sign(w(15,:) * testData(i,:)') == 1 % Health vs Software
                                count(type, 5) = count(type, 5) + 1;
                            else
                                count(type, 6) = count(type, 6) + 1;
                            end
                        end
                    end
                end
            end
        end
        type
    end
    break;
end
%avarage = count/folds;
%correctness = avarage/(testLength*2);
correctness = count / 190;
end

