clear all;
f1 = (pi/4)/(2*pi);
f2 = pi/(2*pi);
f = [0,f1,f1+0.01,f2]*2;
A = [1,1,0,0];
weight = [1,1];
b = remez(54,f,A,weight);
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

 