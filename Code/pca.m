function [new_train_data, new_test_data, new_dim] = pca(train_data, test_data, dim, total_classes)
    [W,S,V] = svds(train_data, total_classes-1);
    
    new_train_data = zeros(total_classes-1, size(train_data, 2));
    new_test_data = zeros(total_classes-1, size(test_data, 2));
    
    for i=1:size(train_data, 2)
        new_train_data(:,i) = W.' * train_data(:,i);
    end
    for i=1:size(test_data, 2)
        new_test_data(:,i) = W.' * test_data(:,i);
    end
    new_dim = size(new_train_data,1);
end