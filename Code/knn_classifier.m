function accuracy = knn_classifier(k, test_data, train_data, label_test, label_train, len_test, len_train)
    % Predict the output for each test case and verify the correctness of your classifier's prediction
    dist = zeros(len_train, 1);
    min_labels = zeros(k, 1);
    accuracy = 0.0;
    for i=1:len_test
        for j = 1:len_train
            dist(j) = (test_data(:,i) - train_data(:,j))'*(test_data(:,i) - train_data(:,j));
        end
        % Sort the nearest neighbor data
        [~, indices] = sort(dist);
        % Extract the indices of k-nearest neighbors
        for m=1:k
            min_labels(m) = label_train(indices(m));
        end
        % Evaluate the prediction of your classifier for each test case
        if mode(min_labels) == label_test(i)
            accuracy = accuracy + 1;
        end
    end
    accuracy = 100*accuracy/len_test;
end