function accuracy = bayes_classifier(train_data, test_data, dim, total_classes, len_train_class, len_test, label_test)
    % Get the mean for each class
    mu = zeros(dim, total_classes);
    for i=1:total_classes
        mu(:, i) = sum(train_data(:, len_train_class*(i-1)+1:len_train_class*i), 2)/len_train_class;
    end
    % Get variance for each class
    sigma = zeros(dim, dim, total_classes);
    sigma_inv = zeros(dim, dim, total_classes);
    for i=1:total_classes
       for j=1:len_train_class
          sigma(:,:,i) = sigma(:,:,i) +  ( train_data(:, len_train_class*(i-1)+j) - mu(:,i) ) * ( train_data(:, len_train_class*(i-1)+j) - mu(:,i) ).';
       end
       sigma(:,:,i) = sigma(:,:,i)/len_train_class;
       sigma(:, :, i) = sigma(:, :, i) + eye(dim);
       sigma_inv(:, :, i) = inv(sigma(:, : ,i));
    end

    % Define the discriminant matrices
    W = zeros(dim, dim, total_classes);
    w = zeros(dim, total_classes);
    w0 = zeros(total_classes, 1);
    % Evaluate various elements in the matrices
    for i=1:total_classes
        w(:, i) = sigma_inv(:, :, i) * mu(:, i);
        w0(i) = -1/2 * mu(:, i)' * sigma_inv(:, :, i) * mu(:, i) - 1/2 * log(det(sigma(:,:,i))); % ignore lnP(wi)
    end
    W(:) = -0.5 * sigma_inv(:);

    % Predict the output for each test case and verify the correctness of your classifier's prediction
    prediction = zeros(len_test, 1);
    accuracy = 0.0;
    for i=1:len_test
        max_g = test_data(:,i)' * W(:,:,1) * test_data(:,i) + w(:,1)' * test_data(:,i) + w0(1);
        for j = 1:total_classes
            g = test_data(:,i)' * W(:,:,j) * test_data(:,i) + w(:,j)' * test_data(:,i) + w0(j);
            if(g >= max_g)
               max_g = g;
               prediction(i) = j;
            end
        end
        % Evaluate the prediction of your classifier for each test case
        if prediction(i) == label_test(i)
            accuracy = accuracy + 1;
        end
    end
    accuracy = 100*accuracy/len_test;
end