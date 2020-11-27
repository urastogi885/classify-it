function alpha = train_kernal_svm(train_data, label_train, len_train, C, kernel, r, sigma)
    K = zeros(len_train, len_train);
    for i=1:len_train
        for j= 1:len_train
            if strcmp(kernel, 'poly')
                K(i,j) = real(kernel_poly(train_data(:,i),train_data(:,j),r));
            elseif strcmp(kernel, 'rbf')
                K(i, j) = kernel_RBF(train_data(:,i),train_data(:,j), sigma);
            end
        end
    end

    H = K.*(label_train*label_train');
    f = -1*ones(len_train,1);
    Aineq = zeros(1, len_train);
    bineq = 0;
    Aeq = zeros(1, len_train);
    beq = 0;
    lb = zeros(len_train,1);
    ub = C*ones(len_train, 1);

    [alpha, ~] = quadprog(H, f , Aineq, bineq, Aeq, beq, lb, ub, [], []);
end