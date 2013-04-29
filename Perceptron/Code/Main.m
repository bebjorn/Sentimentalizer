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

[b_c] = KNearestNeigborsCategories2('books_pos', 'books_neg', 'camera_pos', 'camera_neg',10);
%[b_d] = KNearestNeigborsCategories2('books_pos', 'books_neg', 'dvd_pos', 'dvd_neg',10);
%[b_h] = KNearestNeigborsCategories2('books_pos', 'books_neg', 'health_pos', 'health_neg',10);
%[b_m] = KNearestNeigborsCategories2('books_pos', 'books_neg', 'music_pos', 'music_neg',10);
%[b_s] = KNearestNeigborsCategories2('books_pos', 'books_neg', 'software_pos', 'software_neg',10);

%[c_d] = KNearestNeigborsCategories2('camera_pos', 'camera_neg', 'dvd_pos', 'dvd_neg',10);
%[c_h] = KNearestNeigborsCategories2('camera_pos', 'camera_neg', 'health_pos', 'health_neg',10);
%[c_m] = KNearestNeigborsCategories2('camera_pos', 'camera_neg', 'music_pos', 'music_neg',10);
%[c_s] = KNearestNeigborsCategories2('camera_pos', 'camera_neg', 'software_pos', 'software_neg',10);

%[d_h] = KNearestNeigborsCategories2('dvd_pos', 'dvd_neg', 'health_pos', 'health_neg',10);
%[d_m] = KNearestNeigborsCategories2('dvd_pos', 'dvd_neg', 'music_pos', 'music_neg',10);
%[d_s] = KNearestNeigborsCategories2('dvd_pos', 'dvd_neg', 'software_pos', 'software_neg',10);

%[h_m] = KNearestNeigborsCategories2('health_pos', 'health_neg', 'music_pos', 'music_neg',10);
%[h_s] = KNearestNeigborsCategories2('health_pos', 'health_neg', 'software_pos', 'software_neg',10);

%[m_s] = KNearestNeigborsCategories2('music_pos', 'music_pos', 'software_pos', 'software_neg',10);

%[correctness] = KNearestNeigborsCategories2('books_pos', 'books_neg', 'camera_pos', 'camera_neg','10');


%results1 = crossValidation('books_pos', 'books_neg', 10)
%results2 = crossValidation('camera_pos', 'camera_neg', 10)
%results3 = crossValidation('dvd_pos', 'dvd_neg', 10)
%results4 = crossValidation('health_pos', 'health_neg', 10)
%results5 = crossValidation('music_pos', 'music_neg', 10)
%results6 = crossValidation('software_pos', 'software_neg', 10)


%results = outOfDomainValidation('books_pos', 'books_neg', 'health_pos', 'health_neg', 10)
%results1 = outOfDomainValidation('health_pos', 'health_neg', 'books_pos', 'books_neg', 10)


% z = matrix1 ~= 0;