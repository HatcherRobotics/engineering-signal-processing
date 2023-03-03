n = 1:500000;

f_s = 100000;
x = exp(-n/f_s);
Mlag = 5000;
n_rx = 1:(2*Mlag+1);
rx = xcorr(x,Mlag,'biased');

subplot(2,1,1)
plot(n,x);
xlabel('n');
ylabel('x');
grid on;

subplot(2,1,2)
plot(n_rx,rx);
xlabel('n');
ylabel('rx');
grid on;