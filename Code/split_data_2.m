function [train_data, test_data, dim, total_classes, len_train_class, len_test_class, len_train, len_test, label_train, label_test] = split_data_2()
    load Data\data.mat face;
    size_data = size(face);
    dim = size_data(1)*size_data(2);
    total_classes = 2;
    len_class = size_data(3)/3;
    % No. of samples for testing and training in each class
    len_train_class = 0.75*len_class;
    len_test_class = len_class-len_train_class;
    % No. of samples in the testing and training data
    len_train = len_train_class*total_classes;
    len_test = len_test_class*total_classes;
    neutral = zeros(dim, size_data(3)/3);
    facial_exp = zeros(dim, size_data(3)/3);
    % Testing and training data sets
    train_data = zeros(dim, len_train);
    test_data = zeros(dim, len_test);
    % Define labels for data sets
    label_train = zeros(len_train, 1);
    label_test = zeros(len_test, 1);
    % Reshape the data set
    for i=1:size_data(3)/3
        neutral(:,i) = reshape(face(:,:,3*i-2), [dim,1]);
        facial_exp(:,i) = reshape(face(:,:,3*i-1), [dim,1]);
    end

    % Add images to the training data set
    train_data(:,1:len_train_class) = neutral(:,1:len_train_class);
    train_data(:,len_train_class+1:len_train) = facial_exp(:,1:len_train_class);
    % Add labels for the training data set
    label_train(1:len_train_class) = 1;
    label_train(len_train_class+1:len_train) = 2;

    % Add images to the testing data set
    test_data(:,1:len_test_class) = neutral(:,len_train_class+1:end);
    test_data(:,len_test_class+1:len_test) = facial_exp(:,len_train_class+1:end);
    % Add labels for the testing data set
    label_test(1:len_test_class) = 1;
    label_test(len_test_class+1:len_test) = 2;
end