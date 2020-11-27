function prediction = test_linear_svm(train_data, test_data, len_train, alpha, label_train, len_test)
    prediction = zeros(len_test,1);
   % K = zeros(testData, trainData)
    for i = 1:len_test
        summ = 0;
        for j = 1:len_train
            K = test_data(:, i)'*train_data(:,j);
            summ = summ + alpha(j)* label_train(j) * K;
        end
        prediction(i) = sign(summ);
    end
end