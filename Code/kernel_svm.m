function accuracy = kernel_svm(train_data, test_data, label_train, label_test, len_train, len_test, kernel)
    C = 10;
    if kernel == '1'
        % Start RBF
        accuracy = zeros(20,1);
        x = 0.01:0.05:1;
        idx = 0;
        r = 0.1;
        for gamma = 0.01:0.05:1
            idx = idx+1;
            alpha = train_kernal_svm(train_data, label_train, len_train, C, 'rbf', r, gamma);

            SVcount = 0;
            tolerance = 0.001;
            for i = 1:size(alpha)
                if abs(alpha(i)-0) > tolerance
                    SVcount = SVcount + 1;
                end
            end

            pred = test_kernal_svm(train_data, test_data, label_train, len_train, len_test, 'rbf', r, gamma, alpha);
            accuracy(idx) = 100*sum(pred==label_test)/len_test;
        end
        plot(x, accuracy);
        xlabel('sigma');
        ylabel('Accuracy');
    else
        % Start Polynomial kernel
        accuracy = zeros(10,1);
        x = 0.1:0.1:1;
        idx = 0;
        gamma = 0.01;
        for r = 0.1:0.1:1
            idx = idx+1;
            alpha = train_kernal_svm(train_data, label_train, len_train, C, 'poly', r, gamma);

            pred = test_kernal_svm(train_data, test_data, label_train, len_train, len_test, 'poly', r, gamma, alpha);
            accuracy(idx) = 100*sum(pred==label_test)/len_test;
        end
        plot(x, accuracy);
        xlabel('r');
        ylabel('Accuracy');
    end
end