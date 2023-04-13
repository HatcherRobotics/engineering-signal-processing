clear all;
N = 256;
n = 0:N-1;
s = rand(1,N);%uniform distribution
s  = s - mean(s);%mean==0
[p1,f1] = pwelch(s,hamming(64),32,4096,1);
p1 = p1/max(p1);
[p2,f2] = pwelch(s,hamming(256),0,4096,1);
p2  = p2/max(p2);
subplot(311)
plot(n,s);
title("signal time domain");
subplot(312)
plot(f1,p1);
title("PSD overlap 32")
subplot(313)
plot(f2,p2);
title("PSD overlap 0")