function [train_data, test_data, dim, total_classes, len_train_class, len_test_class, len_train, len_test, label_train, label_test] = split_data(dataset_index)
    if dataset_index == '1'
        load Data\pose.mat pose;
        size_data = size(pose);
        dim = size_data(1)*size_data(2);
        total_classes = size_data(4);
        len_class = size_data(3);
        % No. of samples for testing and training in each class
        len_train_class = len_class-1;
        len_test_class = 1;
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
        for i=1:total_classes
            for j=1:len_train_class
                train_data(:, len_train_class*(i-1) + j) = reshape(pose(:,:,j,i), [dim, 1]);
            end
            test_data(:, i) = reshape(pose(:,:,len_class,i), [dim, 1]);
            % Add labels
            label_train(len_train_class*(i-1)+1:len_train_class*i) = i;
            label_test(len_test_class*(i-1)+1:len_test_class*i) = i;
        end
    elseif dataset_index == '2'
        load Data/illumination.mat illum;
        size_data = size(illum);
        dim = size_data(1);
        total_classes = size_data(3);
        len_class = size_data(2);
        % No. of samples for testing and training in each class
        len_train_class = len_class-2;
        len_test_class = 2;
        % No. of samples in the testing and training data
        len_train = len_train_class*total_classes;
        len_test = len_test_class*total_classes;
        % Testing and training data sets
        train_data = zeros(dim, len_train);
        test_data = zeros(dim, len_test);
        % Define labels for data sets
        label_train = zeros(len_train, 1);
        label_test = zeros(len_test, 1);
        % Reshape the data set
        illum_reshaped = reshape(illum, [dim, len_class*total_classes]);
        % Add images to each dataset
        for i=1:total_classes
           train_data(:, len_train_class*(i-1)+1:len_train_class*i) = illum_reshaped(:, len_class*(i-1)+1:len_class*i-len_test_class);
           test_data(:, len_test_class*(i-1)+1:len_test_class*i) = illum_reshaped(:, len_class*i-1:len_class*i);
           % Add labels
           label_train(len_train_class*(i-1)+1:len_train_class*i) = i;
           label_test(len_test_class*(i-1)+1:len_test_class*i) = i;
        end
    elseif dataset_index == '3'
        load Data\data.mat face;
        size_data = size(face);
        dim = size_data(1)*size_data(2);
        total_classes = size_data(3)/3;
        len_class = 3;
        % No. of samples for testing and training in each class
        len_train_class = len_class-1;
        len_test_class = 1;
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
        for i=1:total_classes
            count = 0;
            for j=1:len_class
                if j<=len_train_class %control training set
                    train_data(:,len_train_class*i + count) = reshape(face(:,:,len_class*(i-1) + j), [dim,1]);
                    label_train(2*i + count) = i; 
                    count = count + 1;
                else
                    test_data(:,i+1) = reshape(face(:,:,len_class*(i-1) + j), [dim,1]);
                    label_test(i+1) = i+1;
                end
            end
        end
    else
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
end