clear all;
close all;

load testdat;
N=2048;
[xpsd,F]=pyulear(x,8,N,1);
pmax=max(xpsd);
xpsd=xpsd/pmax;
xpsd=10*log10(xpsd+0.000001);
figure('color','w');subplot(321);
plot(F,xpsd);grid on;
title('pyulear 8');

[xpsd,F]=pyulear(x,11,N,1);
pmax=max(xpsd);
xpsd=xpsd/pmax;
xpsd=10*log10(xpsd+0.000001);
subplot(323);
plot(F,xpsd);grid on;
title('pyulear 11');

[xpsd,F]=pyulear(x,14,N,1);
pmax=max(xpsd);
xpsd=xpsd/pmax;
xpsd=10*log10(xpsd+0.000001);
subplot(325);
plot(F,xpsd);grid on;
title('pyulear 14');

[xpsd,F]=pburg(x,8,N,1);
pmax=max(xpsd);
xpsd=xpsd/pmax;
xpsd=10*log10(xpsd+0.000001);
subplot(322);
plot(F,xpsd);grid on;
title('pburg 8');

[xpsd,F]=pburg(x,11,N,1);
pmax=max(xpsd);
xpsd=xpsd/pmax;
xpsd=10*log10(xpsd+0.000001);
subplot(324);
plot(F,xpsd);grid on;
title('pburg 11');


[xpsd,F]=pburg(x,14,N,1);
pmax=max(xpsd);
xpsd=xpsd/pmax;
xpsd=10*log10(xpsd+0.000001);
subplot(326);
plot(F,xpsd);grid on;
title('pburg 14');

figure;
[xpsd,W]=psd_arma(x,7,5,20,N,1);
pmax=max(xpsd);
xpsd=xpsd/pmax;
xpsd=10*log10(xpsd+0.000001);
plot(W(N/2+1:N),xpsd(N/2+1:N));grid on;
title("ARMA-PSD")