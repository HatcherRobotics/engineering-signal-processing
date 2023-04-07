%(1)
N = 500;
n = 0:N-1;
Mlag = 50;
a = rand(1,N);a = a -mean(a);
b = randn(1,N);
ra = xcorr(a,Mlag,'biased');
rb = xcorr(b,Mlag,'biased');
nr = -Mlag:Mlag;
figure(1)
subplot(221)
plot(n,a);
title("uniform distribution noise");
subplot(222)
plot(n,b);
title("normal distribution noise");
subplot(223)
plot(nr,ra);
title("self correlation u_d noise");
subplot(224)
plot(nr,rb);
title("self correlation n_d noise");
%(2)
figure(2)
subplot(211)
histogram(a);
subplot(212)
histogram(b);
