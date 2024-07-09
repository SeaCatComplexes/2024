%找到所有包含零的行
% zero_rows = any(x(:, 2:4) == 0, 2);
% 
% % 删除包含零的行
% x = x(~zero_rows, :);

% 进行插值
% temp = pchip(x(:,1),x(:,5), zero_rows_index)

% 假设已经导入了矩阵 x 和矩阵 q

% 获取 qq 中第五列的行索引
% indexes = q(:, 5);

%将 p 中数据的前四列插入到 x 的相应位置的第二至第五列中
for i = 1:length(indexes)
    x(indexes(i), 2:5) = q(i, 1:4);
end
