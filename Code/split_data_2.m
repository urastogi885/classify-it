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
    % Testing and training data sets
    train_data = zeros(dim, len_train);
    test_data = zeros(dim, len_test);
    % Define labels for data sets
    label_train = zeros(len_train, 1);
    label_test = zeros(len_test, 1);
    % Reshape the data set and add images to each dataset
    for i=1:2*size_data(3)/3
       if mod(i,3) == 2
          train_data(:, floor(i/3)+1) = reshape(face(:,:,i), [dim,1]);
          label_train(floor(i/3)+1) = 1;
       elseif mod(i,3) == 1
          train_data(:, floor(i/3)+2) = reshape(face(:,:,i), [dim,1]);
          label_train(floor(i/3)+1) = 2;
       end
    end
    for i=2*size_data(3)/3+1:size_data(3)
       if mod(i,3) == 2
          test_data(:, floor(i/400)) = reshape(face(:,:,i), [dim,1]);
          label_test(floor(i/400)) = 1;
       elseif mod(i,3) == 1
          test_data(:, floor(i/400)) = reshape(face(:,:,i), [dim,1]);
          label_test(floor(i/400)) = 2;
       end
    end
end