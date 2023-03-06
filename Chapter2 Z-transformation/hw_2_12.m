%1.1
b1 = [0,0.5,-0.5];
a1 = [1,-(2^(0.5))-0.9,1+0.9*(2^(0.5)),-0.9];
%a1 = [1,-2.3142,2.2728,-0.9];
[H,w] = freqz(b1,a1,256,'whole',1);
Hr = abs(H);%amplitude
Hphase = angle(H);%phase
%Hphase = unwrap(Hphase);
figure(1)
subplot(221)
plot(w,Hr);
grid on;
ylabel(' Amplitude');
subplot(222)
plot(w,Hphase);
grid on;
ylabel(' Phase');
%1.2
[h,t]=impz(b1,a1,40);
subplot(223)
stem(t,h,'.');
grid on;
%1.3
x = ones(100);
t = 1:100;
y = filter(b1,a1,x);
subplot(224)
plot(t,y);
grid on;

%2.1
b2 = [0.5,1-0.5*2^0.5,-1.4,0.9];
a2 = [1,-2^0.5-0.9,1+0.9*2^0.5,-0.9];
[H,w] = freqz(b2,a2,256,'whole',1);
Hr2 = abs(H);%amplitude
Hphase = angle(H);%phase
%Hphase = unwrap(Hphase);
figure(2)
subplot(221)
plot(w,Hr2);
grid on;
ylabel(' Amplitude');
subplot(222)
plot(w,Hphase);
grid on;
ylabel(' Phase');
%2.2
[h,t]=impz(b2,a2,40);
subplot(223)
stem(t,h,'.');
grid on;
%2.3
x = ones(100);
t = 1:100;
y = filter(b2,a2,x);
subplot(224)
plot(t,y);
grid on;

%3.1
figure(3)
subplot(2,1,1)
zplane(b1,a1);
subplot(2,1,2)
zplane(b2,a2);