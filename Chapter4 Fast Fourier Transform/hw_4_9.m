clear;
N = 4096;
u = randn(1,N);
n = 0:N-1;
fs = 1;
A =5;f0 = 0.3;
w = 2*pi/fs;
s = A*sin(w*f0*n)+u;
subplot(211)
plot(n,s);
S = fft(s);
f = -0.5:1/N:0.5-1/N;
subplot(212)
plot(f,fftshift(abs(S)));
