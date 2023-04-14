clear all;
close all;
load sunspot.dat;
x=sunspot;
x=x-mean(x);
M=length(x);
N=4096;
w=0:1/N:0.5-1/N;    
X=abs(fft(x,N));
Psd1=X.^2/M;   
figure(1)
plot(w,Psd1(1:N/2));grid on; 
figure(2)
psd_purg1 = pburg(x,5,N);
subplot(231)
plot(w,psd_purg1(1:N/2))
title("pburg 5")
psd_purg2 = pburg(x,10,N);
subplot(232)
plot(w,psd_purg2(1:N/2))
title("pburg 10")
psd_purg3 = pburg(x,20,N);
subplot(233)
plot(w,psd_purg3(1:N/2))
title("pburg 20")
psd_purg4 = pburg(x,30,N);
subplot(234)
plot(w,psd_purg4(1:N/2))
title("pburg 30")
psd_purg5 = pburg(x,40,N);
subplot(235)
plot(w,psd_purg5(1:N/2))
title("pburg 40")
psd_purg6 = pburg(x,50,N);
subplot(236)
plot(w,psd_purg6(1:N/2))
title("pburg 50")