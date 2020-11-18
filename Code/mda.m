function [new_train,new_test,new_dim] = mda(train_data,test_data,dim,total_classes,len_train_class,len_train,len_test,prior)

    prob = prior*zeros(total_classes,1);

    % Mean of classes
    mu = zeros(dim,total_classes);
    mu_total = zeros(dim,1);
    for i = 1:total_classes
        mu(:,i) = sum(train_data(:,len_train_class*(i-1)+1:len_train_class*i), 2)/len_train_class;
        mu_total = mu_total + prob(i)*mu(:,i);
    end

    % Within Scatter matrix
    correction = 1*eye(dim); 
    Sw = zeros(dim,dim);
    for i = 1:total_classes
        Sw = Sw + cov(train_data(:,len_train_class*i-1:len_train_class*i)')*prob(i) + correction;
    end
    if det(Sw) ==  0
        disp('Within scatter matrix singular')
        pause;
    end

    % Between scatter matrix
    Sb = zeros(dim,dim);
    for i = 1:total_classes
        Sb = Sb + prob(i)*(mu(:,i)-mu_total)*(mu(:,i)-mu_total)';
    end

    [e_value,~] = eigs(Sb,Sw,total_classes-1);

    new_train = zeros(total_classes-1,len_train);
    new_test = zeros(total_classes-1,len_test);
    for i = 1:len_train
        new_train(:,i) = e_value'*train_data(:,i);
    end
    for i = 1:len_test
        new_test(:,i) = e_value'*test_data(:,i);
    end
    new_dim = size(new_train, 1);
end
