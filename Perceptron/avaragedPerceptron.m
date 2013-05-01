function [ wa ] = avaragedPerceptron( X, Y , maxIter)
    % Require: X (n*d) matrix where xi = X(i; :) belongs to R(d) 
    % with label yi = Y (i) 2 f1; +1g
    w = randn(length(X(1,:)), 1);
    wa = randn(length(X(1,:)), 1);
    T = length(X(:,1));
    iter_count = 0;
    not_converged = true;
    while not_converged,
       alpha = (maxIter-iter_count)/maxIter;
        for i = 1 : T,
            if sign(w' * X(i,:)') ~= Y(i)  % y(i) x(i) check correct
                w = w + alpha * Y(i) * X(i,:)';
                not_converged = true;
                average_weight = (maxIter*T - iter_count) / (maxIter*T);
                wa = wa + average_weight * alpha * Y(i) * X(i,:)';
            end
        end
        iter_count = iter_count + 1;
        if(iter_count > maxIter),
            break;
        end
    end
    %w = w / norm(w);
end
