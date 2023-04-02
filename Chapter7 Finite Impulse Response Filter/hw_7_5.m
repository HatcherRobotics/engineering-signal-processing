clear all;
f = [0 0.05 0.1 0.15 0.18 0.25 0.3 0.36 0.41 0.5]*2;
A = [0 0 1 1 0 0 1 1 0 0];
weight = [10 1 10 1 10];
b = remez(54,f,A,weight);
[h,w] = freqz(b,1,256,1);
hr = abs(h);
hr = 20*log10(hr);
Hphase = phase(h);
Hphase = unwrap(Hphase);
subplot(311)
stem(b,'.');
subplot(312)
plot(w,hr);
subplot(313)
plot(w,Hphase);