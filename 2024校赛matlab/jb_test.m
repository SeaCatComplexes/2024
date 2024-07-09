%正态分布检验
%用循环检验所有列的数据，先记录数据列数后进行检验
n_c = size(x2,2); 
P = zeros(1,7);
for i = 1:n_c
[h,p] = jbtest(x2(:,i),0.05);
H(i)=h;
P(i)=p;
end
disp(H)
disp(P)