function accuracy = knn_classifier(test_data, train_data, label_test, label_train, len_test, len_train)
    % Predict the output for each test case and verify the correctness of your classifier's prediction
    prediction = zeros(len_test, 1);
    accuracy = 0.0;
    for i=1:len_test
        min_dist = (test_data(:,i) - train_data(:,1))'*(test_data(:,i) - train_data(:,1));
        for j = 1:len_train
            dist = (test_data(:,i) - train_data(:,j))'*(test_data(:,i) - train_data(:,j));
            if dist <= min_dist
               min_dist = dist;
               prediction(i) = label_train(j);
            end
        end
        % Evaluate the prediction of your classifier for each test case
        if prediction(i) == label_test(i)
            accuracy = accuracy + 1;
        end
    end
    accuracy = 100*accuracy/len_test;
end