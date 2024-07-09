% qq图进行粗检验
qqplot(x1(:,1))
% 依次处理x1，x2的每一列
% qqplot(x1(:,2))
% qqplot(x1(:,3))
% qqplot(x1(:,4))
% qqplot(x1(:,5))
% qqplot(x1(:,6))
% qqplot(x1(:,7))
% qqplot(x2(:,1))
% qqplot(x2(:,2))
% qqplot(x2(:,3))
% qqplot(x2(:,4))
% qqplot(x2(:,5))
% qqplot(x2(:,6))
% qqplot(x2(:,7))

%正态分布J-B检验，H输出1代表不符合，输出0代表符合 
%用循环检验所有列的数据
columns = size(x1,2); % 获取变量列数
P = zeros(1,5);
for i = 1:columns
[h,p] = jbtest(x1(:,i),0.05);
H(i)=h;
P(i)=p;
end
disp(H)
disp(P) 

% columns = size(x2,2);
% P = zeros(1,5);
% for i = 1:columns
% [h,p] = jbtest(x1(:,i),0.05);
% H(i)=h;
% P(i)=p;
% end
% disp(H)
% disp(P)


%斯皮尔曼相关系数检验
[R,P]=corr(x1, 'type' , 'Spearman')

% [R,P]=corr(x2, 'type' , 'Spearman')



