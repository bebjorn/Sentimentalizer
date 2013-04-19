%results = zeros(10, 10);

%[correctness, count] = crossValidationCategory(10);

results = crossValidation('health_pos', 'health_neg', 10)
%results = outOfDomainValidation('books_pos', 'books_neg', 'health_pos', 'health_neg', 10)

% z = matrix1 ~= 0;