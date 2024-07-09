import pandas as pd
import numpy as np
import matplotlib.pyplot as plt


df = pd.read_excel('整合处理数据.xlsx', sheet_name = 'Sheet5',header=None, skiprows=1)
data = df.iloc[:, 0].values

# 傅立叶变换
fft_result = np.fft.fft(data)
fft_freq = np.fft.fftfreq(len(data))

# 去除直流分量
nonzero_indices = np.where(fft_freq != 0)[0]
nonzero_fft_result = np.abs(fft_result[nonzero_indices])
nonzero_fft_freq = fft_freq[nonzero_indices]

main_freq_index = np.argmax(nonzero_fft_result)
main_freq = nonzero_fft_freq[main_freq_index]

# 计算周期
period = 1 / np.abs(main_freq)

# 作图
plt.figure(figsize=(10, 6))
plt.plot(nonzero_fft_freq, nonzero_fft_result)
plt.xlabel('Frequency')
plt.ylabel('Amplitude')
plt.title('FFT Spectrum')


# 添加峰值标记
plt.scatter(nonzero_fft_freq[main_freq_index], nonzero_fft_result[main_freq_index], color='red', label='Peak')

# 导出图片
plt.savefig('fft结果图.png')
plt.legend()
plt.show()

print("数据的周期为:", period)