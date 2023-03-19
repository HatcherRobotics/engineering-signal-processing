f1 = 10.8;f2 = 11.75;f3 = 12.55;
fs = 40;N =64;
n = 0:N-1;
x = sin(2*pi*f1*n/fs)+sin(2*pi*f2*n/fs)+sin(2*pi*f3*n/fs);
X = fft(x);
f = fs/N*(0:N/2-1);
subplot(231)
plot(n,x);
subplot(232)
stem(f,abs(X(1:N/2)),'.');
xlabel("Hz");
title("0N");

X_3N = fft(x,4*N);
f_3N = fs/(4*N)*(0:2*N-1);
subplot(233)
stem(f_3N,abs(X_3N(1:2*N)),'.')
xlabel("Hz");
title("3N");
X_7N = fft(x,8*N);
f_7N = fs/(8*N)*(0:4*N-1);
subplot(234)
stem(f_7N,abs(X_7N(1:4*N)),'.')
xlabel("Hz");
title("7N");

X_15N = fft(x,16*N);
f_15N = fs/(16*N)*(0:8*N-1);
subplot(235)
stem(f_15N,abs(X_15N(1:8*N)),'.');
xlabel("Hz");
title("15N");