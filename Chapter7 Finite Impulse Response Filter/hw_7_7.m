clear all;
N =128;
n = 0:N-1;
papoulis = (1/pi)*abs(sin(2*pi.*n/N))-(1-2*abs(n-N/2)/N).*cos(2*pi.*n/N);
[h,w] = freqz(papoulis,1,256,'whole',1);
h = abs(h);
h = 20*log10(h/abs(h(1)));
subplot(211)
stem(n,papoulis,'k.');
subplot(212)
w = w-0.5;
plot(w,fftshift(h));
axis([-0.5, 0.5, -100, 0]);