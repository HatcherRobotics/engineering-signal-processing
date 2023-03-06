%1
[sunspot,txt,raw]=xlsread("/sunspot.xlsx");
subplot(2,2,1)
stem(sunspot(1:100,1),sunspot(1:100,2));
xlabel("year")
ylabel("number of sunspots")
grid on;

%2
M = 32;
r_sunspot = xcorr(sunspot(1:100,2),M,'biased');
m = 1:(2*M+1);
subplot(2,2,2)
plot(m,r_sunspot);
xlabel("year")
ylabel("self correlation of sunspot")
grid on;

%3
x_n = sunspot(1:100,2);
a = sum(sunspot);
mu = a(1,2)/100;
x = x_n-mu;
subplot(2,2,3)
stem(sunspot(1:100,1),x);
xlabel("year")
ylabel("number of sunspots-mean")
r_x = xcorr(x,M,'biased');
subplot(2,2,4)
plot(m,r_x);
xlabel("year");
ylabel("self correlation of x-mu")
grid on;
