clear all;
rp = 3;rs=50;
fp = [44,56];
fs =[47,53];
Fs=1000;
wp = fp*2*pi/Fs;
ws = fs*2*pi/Fs;
[n,wn] = cheb1ord(wp/pi,ws/pi,rp,rs);
[b,a]=cheby1(n,rp,wp/pi,'stop');
[h,w]=freqz(b,a,256,Fs);
Hphase=angle(h);
Hphase = unwrap(Hphase);
h=20*log10(abs(h));
subplot(211)
plot(w,h);
subplot(212)
plot(w,Hphase);
