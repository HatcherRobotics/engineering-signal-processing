%1
figure(1)
plot(sunspot(1:100,1),sunspot(1:100,2));
xlabel("year")
ylabel("number of sunspots")
grid on;

%2
M = 32;
r_sunspot = xcorr(sunspot(1:100,2),M,'biased');
m = 1:(2*M+1);
figure(2)
plot(m,r_sunspot);
xlabel("m")
ylabel("self correlation of sunspot")
grid on;

%3
x_n = sunspot(1:100,2);
a = sum(sunspot);
mu = a(1,2)/100;
x = x_n-mu;
r_x = xcorr(x,M,'biased');
figure(3)
plot(m,r_x);
xlabel("m");
ylabel("self correlation of x-mu")
grid on;
