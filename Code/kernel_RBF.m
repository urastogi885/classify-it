function f_x = kernel_RBF(x1,x2,sigma)
    f_x  = exp(-(norm(x1-x2)/sigma)^2);
end