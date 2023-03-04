%hw_2_11
%1
b = [0,-.2];
a = [1,0,0.8];
[H,w] = freqz(b,a,256,'whole',1);
Hr = abs(H);%amplitude
Hphase = angle(H);%phase
Hphase = unwrap(Hphase);

figure(1)
subplot(211)
plot(w,Hr);
grid on;
ylabel(' Amplitude');
subplot(212)
plot(w,Hphase);
grid on;
ylabel(' Phase');

%2
[h,t]=impz(b,a,40);
figure(2)
stem(t,h,'.');
grid on;

%3
x = ones(100);
t = 1:100;
y = filter(b,a,x);

figure(3)
plot(t,y);
grid on;
