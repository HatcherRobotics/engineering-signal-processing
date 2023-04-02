clear all;
N = 31;
t = 0:N-1;

%boxcar
wb1 = boxcar(N);
[h1,w] = freqz(wb1,1,256,'whole',1);
subplot(321)
stem(t,wb1,'.');
ylabel('boxcar');
subplot(322)
h1=20*log10(abs(h1)/abs(h1(1)));
w = w-0.5;
plot(w,fftshift(h1));
axis([-0.5, 0.5, -100, 0]);

%hamming
wb2 = hamming(N);
[h2,w] = freqz(wb2,1,256,'whole',1);
subplot(323)
stem(t,wb2,'.');
ylabel('hamming');
subplot(324)
h2=20*log10(abs(h2)/abs(h2(1)));
w = w-0.5;
plot(w,fftshift(h2));
axis([-0.5, 0.5, -100, 0]);

%hanning
wb3 = hanning(N);
[h3,w] = freqz(wb3,1,256,'whole',1);
subplot(325)
stem(t,wb3,'.');
ylabel("hanning");
subplot(326)
h3=20*log10(abs(h3)/abs(h3(1)));
w = w-0.5;
plot(w,fftshift(h3));
axis([-0.5, 0.5, -100, 0]);