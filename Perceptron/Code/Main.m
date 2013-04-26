%results = zeros(10, 10);

%[correctness, count] = crossValidationCategory(10);

%[correctness1] = kNearestNeighbour('books_pos', 'books_neg', 30)
%[correctness2] = kNearestNeighbour('camera_pos', 'camera_neg', 10)
%[correctness3] = kNearestNeighbour('dvd_pos', 'dvd_neg', 10)
%[correctness4] = kNearestNeighbour('health_pos', 'health_neg', 10)
%[correctness5] = kNearestNeighbour('music_pos', 'music_neg', 10)
%[correctness6] = kNearestNeighbour('software_pos', 'software_neg', 10)
%[correctness5] = kNearestNeighbour('books_pos', 'music_neg', 10)
%[correctness6] = kNearestNeighbour('software_pos', 'software_neg', 10)

[correctness] = KNearestNeigborsCategories('10');

%results1 = crossValidation('books_pos', 'books_neg', 10)
%results2 = crossValidation('camera_pos', 'camera_neg', 10)
%results3 = crossValidation('dvd_pos', 'dvd_neg', 10)
%results4 = crossValidation('health_pos', 'health_neg', 10)
%results5 = crossValidation('music_pos', 'music_neg', 10)
%results6 = crossValidation('software_pos', 'software_neg', 10)


%results = outOfDomainValidation('books_pos', 'books_neg', 'health_pos', 'health_neg', 10)
%results1 = outOfDomainValidation('health_pos', 'health_neg', 'books_pos', 'books_neg', 10)


% z = matrix1 ~= 0;