f1 = 10.8;f2 = 11.75;f3 = 12.55;
fs = 40;N =64;
n = 0:N-1;
x = sin(2*pi*f1*n/fs)+sin(2*pi*f2*n/fs)+sin(2*pi*f3*n/fs);
X = fft(x);
f = -0.5:1/N:0.5-1/N;
figure(1)
subplot(211)
plot(n,x);
subplot(212)
plot(f,fftshift(abs(X)));

X_3N = fft(x,4*N);
figure(2)
subplot(211)
plot(n,x);
f_3N = -0.5:1/(4*N):0.5-1/(4*N);
subplot(212)
plot(f_3N,fftshift(abs(X_3N)))

X_7N = fft(x,8*N);
figure(3)
subplot(211)
plot(n,x);
f_7N = -0.5:1/(8*N):0.5-1/(8*N);
subplot(212)
plot(f_7N,fftshift(abs(X_7N)))

X_15N = fft(x,16*N);
figure(4)
subplot(211)
plot(n,x);
f_15N = -0.5:1/(16*N):0.5-1/(16*N);
subplot(212)
plot(f_15N,fftshift(abs(X_15N)))