clear;
f0 = 50;
N =16;
n = 0:N-1;
f = -0.5:1/N:0.5-1/N;
%fs=100Hz
fs1 = 100;
x1 = sin((2*pi*f0/fs1)*n);
X1 = fft(x1);
figure(1)
subplot(211)
plot(n,x1);
subplot(212)
plot(f,fftshift(abs(X1)));

%fs = 150Hz
fs2 = 150;
x2 = sin((2*pi*f0/fs2)*n);
X2 = fft(x2);
figure(2)
subplot(211)
plot(n,x2);
subplot(212)
plot(f,fftshift(abs(X2)));

%fs = 200Hz
fs3 = 200;
x3 = sin((2*pi*f0/fs3)*n);
X3 = fft(x3);
figure(3)
subplot(211)
plot(n,x3);
subplot(212)
plot(f,fftshift(abs(X3)));