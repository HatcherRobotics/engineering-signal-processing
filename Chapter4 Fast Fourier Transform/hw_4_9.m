clear;
N = 4096;
u = randn(1,N);
n = 0:N-1;
fs = 1.5;
A =5;f0 = 0.3;
w = 2*pi*f0;
s = A*sin(w/fs*n)+u;
subplot(211)
plot(n,s);
S = fft(s);
f = fs/N*(1:N/2);
subplot(212)
plot(f,abs(S(1:N/2)));
