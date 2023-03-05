n = 1:500;
f_s = 10;
x = exp(-n/f_s);
Mlag = 50;
n_rx = -Mlag:Mlag;
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