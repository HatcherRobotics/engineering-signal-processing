clear;
f0 = 50;
N =16;
n = 0:N-1;
%fs=100Hz
fs1 = 100;
f1 = fs1/N*(0:N/2-1);
x1 = sin((2*pi*f0/fs1)*n);
X1 = fft(x1);
X1 = abs(X1);
subplot(321)
stem(n,x1,'.')
title("fs=100hz")
subplot(322)
stem(f1,X1(1:N/2),'.');
xlabel("Hz");
title("fs=100hz");

%fs = 150Hz
fs2 = 150;
f2 = fs2/N*(0:N/2-1);
x2 = sin((2*pi/fs2)*f0*n);
X2 = fft(x2);
X2 = abs(X2);
subplot(323)
stem(n,x2,'.');
title("fs=150hz")
subplot(324)
stem(f2,X2(1:N/2),'.');
xlabel("Hz");
title("fs=150hz");

%fs = 200Hz
fs3 = 200;
f3 = fs3/N*(0:N/2-1);
x3 = sin((2*pi/fs3)*f0*n);
X3 = fft(x3);
X3 = abs(X3);
subplot(325)
stem(n,x3,'.');
title("fs=200hz")
subplot(326)
stem(f3,X3(1:N/2),'.');
xlabel("Hz");
title("fs=200hz");
Et3 = 0;
for i = 1:N
    Et3=Et3+x3(i)^2;
end
Ef3 = 2/16*8^2;