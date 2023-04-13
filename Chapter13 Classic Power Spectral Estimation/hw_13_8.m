clear all;
close all;
load test x;
[xpsd1,f1] = pwelch(x,triang(32),16,4096,1);
xpsd1 = xpsd1/max(xpsd1);
xpsd1 = 10*log10(xpsd1);
[xpsd2,f2] = pwelch(x,hamming(32),16,4096,1);
xpsd2 = xpsd2/max(xpsd2);
xpsd2 = 10*log10(xpsd2);
subplot(211)
plot(f1,xpsd1);
grid on;
subplot(212)
plot(f2,xpsd2);
grid on;
