%Butt LP
clear all;
rp = 3;
wp = 0.2*pi;
ws = 0.5*pi;
rs = 30;
Fs = 100000;
[n,wn]=buttord(wp/pi,ws/pi,rp,rs);
[b,a]=butter(n,wp/pi);
[h,w]=freqz(b,a,128,Fs);
Hphase = angle(h);
Hphase = unwrap(Hphase);
h = abs(h);
%h = 20*log10(h);
subplot(211)
plot(w,h);
subplot(212)
plot(w,Hphase);
