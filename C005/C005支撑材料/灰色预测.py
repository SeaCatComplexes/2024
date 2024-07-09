import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import gm

# 让图片可以显示中文
plt.rcParams['font.sans-serif'] = 'SimHei'
# 让图片可以显示负号
plt.rcParams['axes.unicode_minus'] = False

all_data = pd.read_excel(io='整合处理数据.xlsx',sheet_name='Sheet4',engine='openpyxl')
data = all_data['MAX排序'].tolist()
years = [1,2,3,4,5,6,7,8,9,10,11,12,13]

data_1 = np.cumsum(data)
print(data_1)

#判断是否符合准指数规律
rho = np.divide(data[1:],data_1[0:-1])# 两数组间点除
plt.plot(years[1:],rho,linestyle = '-',)
plt.axhline(y=0.5,color='r',linestyle='--')
plt.scatter(years[1:],rho,c = 'r')
plt.xlabel('时间')
plt.ylabel('原始数据的光滑度')
plt.show()

result_rho_1 = float(np.sum(rho<0.5)/len(rho))
print("光滑比小于0.5的数据占比是",result_rho_1 * 100,'%')
result_rho_2 = float(np.sum(rho[2:]<0.5)/len(rho[2:]))
print("除去前两个时期外，光滑比小于0.5的数据占比是", result_rho_2 * 100,'%')

test_num = 0
if len(data) <= 7:
    test_num = 2
elif len(data) >7:
    test_num = 3

data_train = data[:-test_num]
print('实验数据为：\n',data_train)
data_test = data[-test_num:]
print('测试数据为：\n',data_test)

(result1,x0_hat1,_,_) = gm.gm(data_train,test_num)
print(result1)
print(x0_hat1)

data_result1 = np.concatenate((data_train,result1))


plt.xlabel('时间')
plt.ylabel('载流量[A]')
plt.plot(years,data_result1,c = 'b',label = '预测值')
plt.scatter(years[10:13],data_result1[10:13],label = '预测值')
plt.scatter(years[:10],data[:10],label = '实际值')
plt.legend()
plt.show()

result2 = gm.new_gm(data_train,test_num)
data_result2 = np.concatenate((data_train,result2))
print(data_result2)

plt.xlabel('时间')
plt.ylabel('载流量[A]')
plt.plot(years,data_result2,c = 'b',label = '预测值')
plt.legend()
plt.scatter(years[10:13],data_result2[10:13],label = '预测值')
plt.scatter(years[:10],data[:10],label = '实际值')
plt.legend()
plt.xticks(years)
plt.show()

result3 = gm.met_gm(data_train,test_num)
data_result3 = np.concatenate((data_train,result3))

plt.xlabel('时间')
plt.ylabel('载流量[A]')
plt.plot(years,data_result3,c = 'b',label = '预测值')
plt.legend()
plt.scatter(years[10:13],data_result3[10:13],label = '预测值')
plt.scatter(years[:10],data[:10],label = '实际值')
plt.legend()
plt.xticks(years)
plt.show()

print(data_result1)
print(data_result2)
print(data_result3)






