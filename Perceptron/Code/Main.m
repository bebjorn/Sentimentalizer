%results = zeros(10, 10);

%y = crossValidationCatagory('dvd_pos', 'music_pos', 10);

%results = crossValidation('health_pos', 'health_neg', 10)
results = outOfDomainValidation('health_pos', 'health_neg', 'books_pos', 'books_neg', 10)

% z = matrix1 ~= 0;