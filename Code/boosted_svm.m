function accuracy = boosted_svm(train_data, test_data, len_train, label_train, label_test,len_test)
    C = 10;
    w = ones(len_test,1);
    accuracy = zeros(50,1);
    for i=1:50
        p_n = w/sum(w);
        alpha = train_linear_svm(train_data, label_train, len_train, C);
        pred = test_linear_svm(train_data, test_data, len_train, alpha, label_train, len_test);
        error = 0;
        for j=1:len_test
            if pred(j) ~= label_test(j)
                error = error + p_n(j);
            end
        end
        a = 0.5*log((1-error)/error);
        for j=1:len_test
            w(j) =  w(j)*exp(-a*label_test(j)*pred(j));
        end
        accuracy(i) = 100*sum((pred==label_test)/len_test);
    end
end