%1
N=50000;
p = 0.1;
u = rand(1,N);
u = u-mean(u);
a = sqrt(12*p);
u = u*a;
power_u = var(u);
subplot(2,2,1)
plot(u(1:100));
xlabel('n:1-100');
ylabel('white noise u');
grid on;

Mflag = 60;
ru = xcorr(u,Mflag,'biased');
m = 1:2*Mflag+1;%2N+1
subplot(2,2,2)
plot(m,ru);
xlabel('m=1:2*Mflag+1');
ylabel('self correlation of u');
grid on;
%2
omega = pi/16;
n = 1:N;
p_signal = 0.1*10^(10/10);
A = sqrt(2*p_signal);
x = A*sin(omega*n)+u;

subplot(2,2,3)
plot(n(1:100),x(1:100));
xlabel('n');
ylabel('x');
grid on;

rx = xcorr(x,Mflag,'biased');
subplot(2,2,4)
plot(m,rx);
xlabel('m');
ylabel('self correlation of x');
grid on;

