%矩形窗 (不加窗)
f1 = 10.8;f2 = 11.75;f3 = 12.55;
fs = 40;N =1024;
n = 0:N-1;
x = sin(2*pi*f1*n/fs)+sin(2*pi*f2*n/fs)+sin(2*pi*f3*n/fs);
X = fft(x);
X=2*abs(X)/N;
f = fs/N*(0:N/2-1);
subplot(231)
plot(n,x);
subplot(232)
stem(f,abs(X(1:N/2)),'.');
xlabel("hz");
title("矩形窗");

%升余弦窗
wt1=0.5-0.5*cos(2*pi*n/N);
x = wt1.*x;
X = fft(x);
X=2*2*abs(X)/N;
f = fs/N*(0:N/2-1);
subplot(233)
stem(f,abs(X(1:N/2)),'.');
xlabel("hz");
title("升余弦窗");

%平顶窗
wt2=1-1.93*cos(2*pi*n/N)+1.29*cos(4*pi*n/N)-0.388*cos(6*pi*n/N)+0.0322*cos(8*pi*n/N);
x = wt2.*x;
X = fft(x);
X=2*abs(X)/N;
f = fs/N*(0:N/2-1);
subplot(234)
stem(f,abs(X(1:N/2)),'.');
xlabel("hz");
title("平顶窗");

%改进升余弦窗
wt3=0.54-0.46*cos(2*pi*n/N);
x = wt3.*x;
X = fft(x);
X=1.852*2*abs(X)/N;
f = fs/N*(0:N/2-1);
subplot(235)
stem(f,abs(X(1:N/2)),'.');
xlabel("hz");
title("改进升余弦窗");

