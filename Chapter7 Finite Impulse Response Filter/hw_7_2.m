clear all;
f = [0 1/6 1/6+0.05 1/3-0.05 1/3 1];
A = [1,1,0,0,1,1];
weight = [1,1,1];
b = remez(28,f,A,weight);
[h,w] = freqz(b,1,256,1);
hr = abs(h);
hr = 20*log10(hr);
Hphase = phase(h);
Hphase = unwrap(Hphase);
figure(1)
stem(b,'.');
figure(2)
plot(w,hr);
figure(3)
plot(w,Hphase);
