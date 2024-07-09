% 将指标变为列向量，然后再用sim函数预测
net = results.Network;
sim(net, new_x(1,:)')

% 利用循环预测接下来的十个样本的辛烷值
% 先初始化predict_y
predict_y = zeros(785,1); 
for i = 1: 785
    result = sim(net, new_x(i,:)');
    predict_y(i) = result;
end


