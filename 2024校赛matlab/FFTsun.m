
% 关注微信公众号：数学建模BOOM，获取更多数模资讯
% 关注b站up主：数学建模BOOM，不定期更新数模课程
% year = sunspot(:,1);
% relNums = sunspot(:,2);

figure
plot(year,relNums)
xlabel('Year')
ylabel('Current')
title('Current data')
hold on

figure
y = fft(y);
y(1) = [];
plot(y,'ro')
xlabel('real(y)')
ylabel('imag(y)')
title('Fourier Coefficients')
hold on

figure
n = length(y);
power = abs(y(1:floor(n/2))).^2; % power of first half of transform data
maxfreq = 1/2;                   % maximum frequency
freq = (1:n/2)/(n/2)*maxfreq;    % equally spaced frequency grid
plot(freq,power)
xlabel('Cycles/Year')
ylabel('Power')
hold on

figure
period = 1./freq;
plot(period,power);
xlim([0 50]); %zoom in on max power
xlabel('Years/Cycle')
ylabel('Power')
