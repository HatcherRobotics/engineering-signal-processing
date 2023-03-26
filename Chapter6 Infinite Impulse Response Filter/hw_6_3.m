clear all;
%HP
fp = 400;fs=300;Fs=1000;rp=3;rs=35;
wp = 2*pi*fp/Fs;ws = 2*pi*fs/Fs;
%Butt
[n1,wn1]=buttord(wp/pi,ws/pi,rp,rs);
[b1,a1]=butter(n1,wp/pi,'high');
[h1,w1]=freqz(b1,a1,256,Fs);
Hphase1 = angle(h1);
Hphase1 = unwrap(Hphase1);
h1=abs(h1);
figure(1)
subplot(211)
plot(w1,abs(h1));
subplot(212)
plot(w1,Hphase1);
%Cheb
[n2,wn2]= cheb1ord(wp/pi,ws/pi,rp,rs);
[b2,a2]= cheby1(n2,rp,wp/pi,'high');
[h2,w2]=freqz(b2,a2,256,Fs);
Hphase2 = angle(h2);
Hphase2 = unwrap(Hphase2);
h2 = abs(h2);
figure(2)
subplot(211)
plot(w2,h2);
subplot(212)
plot(w2,Hphase2)
%BP
fs = [200,500];fp=[300,400];Fs = 2000;rp=3;rs=40;
wp = 2*pi*fp/Fs;ws = 2*pi*fs/Fs;
%Butt
[n3,wn3]=buttord(wp/pi,ws/pi,rp,rs);
[b3,a3]=butter(n3,wp/pi);
[h3,w3]=freqz(b3,a3,256,Fs);
Hphase3 = angle(h3);
Hphase3 = unwrap(Hphase3);
h3 = abs(h3);
figure(3)
subplot(211)
plot(w3,h3);
subplot(212)
plot(w3,Hphase3);
%Cheb
[n4,wn4] = cheb1ord(wp/pi,ws/pi,rp,rs);
[b4,a4]=cheby1(n4,rp,wp/pi);
[h4,w4]=freqz(b4,a4,256,Fs);
Hphase4 = angle(h4);
Hphase4 = unwrap(Hphase4);
h4 = abs(h4);
figure(4)
subplot(211)
plot(w4,h4);
subplot(212)
plot(w4,Hphase4);