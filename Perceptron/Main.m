% You can uncomment those to test the Perceptron and averaged perceptron

%[correctness, count] = crossValidationCategory(10);


%results1 = crossValidation('books_pos', 'books_neg', 10)
%results2 = crossValidation('camera_pos', 'camera_neg', 10)
%results3 = crossValidation('dvd_pos', 'dvd_neg', 10)
%results4 = crossValidation('health_pos', 'health_neg', 10)
%results5 = crossValidation('music_pos', 'music_neg', 10)
%results6 = crossValidation('software_pos', 'software_neg', 10)


%results = outOfDomainValidation('books_pos', 'books_neg', 'health_pos', 'health_neg', 10)
%results1 = outOfDomainValidation('health_pos', 'health_neg', 'books_pos', 'books_neg', 10)

