function alpha = train_linear_svm(train_data, label_train, len_train, C)
    K = zeros(len_train, len_train);
    for i=1:len_train
        for j= 1:len_train
            K(i,j) = train_data(:, i)'*train_data(:,j);
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