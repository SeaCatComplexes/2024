% 初始化一个空向量 z，用于存储零的行索引
z = [];
% 遍历 y 中的元素，检查是否为零，并记录行索引
for i = 1:length(y)
    if y(i) == 0
        z = [z; i];
    end
end
y(z) = [];
x(z) = [];
p = pchip(x,y,z)
q=spline(x,y,z)

indices = q(:, 2); % 第二列为索引
values = q(:, 1); % 第一列为值

% 根据索引将 y 中的值替换为 p 中的值
for i = 1:length(indices)
    yangtiao(indices(i)) = values(i);
end
