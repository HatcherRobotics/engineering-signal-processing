clear;
f0 = 50;
N =16;
n = 0:N-1;
f = -0.5:1/(2*N):0.5-1/(2*N);
fs3 = 200;
x3 = sin((2*pi*f0/fs3)*n);
X3 = fft(x3,2*N);
figure(3)
subplot(211)
plot(n,x3);
subplot(212)
plot(f,fftshift(abs(X3)));