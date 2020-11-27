function ypredicted = test_kernal_svm(train_data, test_data, label_train, len_train, len_test, kernel, r, gamma, alpha)
    K = [];
    ypredicted = zeros(len_test,1);
    for i = 1:len_test
        summ = 0;
        for j = 1:len_train           
            if strcmp(kernel, 'poly')
                K = kernel_poly(test_data(:,i),train_data(:,j),r);
            elseif strcmp(kernel,'rbf')
                K = kernel_RBF(test_data(:,i),train_data(:,j),gamma);
            end
            summ = summ + alpha(j)* label_train(j) * K;    
        end
        ypredicted(i) = sign(summ);    
    end
end