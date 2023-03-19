clear;
f0 = 50;
N =16;
n = 0:N-1;
fs3 = 200;
f = fs3/(2*N)*(0:(2*N/2-1));
x3 = sin((2*pi*f0/fs3)*n);
X3 = fft(x3,2*N);
subplot(211)
plot(n,x3);
subplot(212)
stem(f,abs(X3(1:N)),'.');