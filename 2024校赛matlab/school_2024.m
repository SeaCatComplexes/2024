net = results.Network;
sim(net, new_x(1,:)')
predict_y = zeros(2475,1); % 初始化predict_y
for i = 1: 2475
    result = sim(net, new_x(i,:)');
    predict_y(i) = result;
end
disp('预测值为：')
disp(predict_y)


R = corrcoef(x)