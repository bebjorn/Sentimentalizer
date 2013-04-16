path = '../../data/output/';

matrix = textread(strcat(path,'books_pos'));
matrix2 = textread(strcat(path,'books_neg'));

matrix = [matrix,ones(1000,1)];
matrix2 = [matrix2,ones(1000,1)];

b = [ones(900); ones(900)*-1];
Ytest = [ones(100); ones(100)*-1];
count = 0;

for k = 1:100:900
    a = [matrix([1:1:k-1, k+100:1:1000],:);matrix2([1:1:k-1, k+100:1:1000], :)];
    test = [matrix([k:1:k+100],:);matrix2([k:1:k+100], :)];
    w = perceptron(a,b);
    for i = 1 : 200,
        if sign(w' * test(i,:)') == Ytest(i)  % y(i) x(i) check correct
            count = count + 1;
        end
    end
end

avarage = count/10;