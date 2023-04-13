clear all;
close all;
load test x;
Mlag = 32;
rn  = -Mlag:Mlag;
rx = xcorr(x,Mlag,'biased');
rx_real = real(rx);
rx_imag = imag(rx);
subplot(211)
plot(rn,rx_real);
title("real");
grid on;
subplot(212)
plot(rn,rx_imag)
title("imaginary");
grid on;