function Accuracy(test_label,test_pred)

    % Record the successful prediction number
    k1=0;
    k2=0;
    
    % Identify the successful predictions of input
    for i = 1:length(test_pred)
        if test_pred(i)==1
            if test_label(i) == test_pred(i)
                k1=k1+1;
            end
        end
        if test_pred(i)==-1
            if test_label(i) == test_pred(i)
                k2=k2+1;
            end
        end
    end
    
    % Calculate the accuracy and Display the accuracy
    accuracy = (k1+k2)/length(test_pred);
    Z=['Accuracy ',num2str(accuracy)];
    X=['there are ',num2str(k1), ' successful predictions of 1 in ',num2str(length(test_pred)),' total input cases'];
    Y=['there are ',num2str(k2), ' successful predictions of -1 in ',num2str(length(test_pred)),' total input cases'];
    disp(Z);
    disp(X);
    disp(Y);
end