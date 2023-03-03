%1.公频信号
n =1:100;
A = 220;
f_0 = 50;
f_s = 1000;
x_1 = A*sin(2*pi*f_0*n/f_s);
subplot(2,3,1)
plot(n,x_1);
xlabel('n');
ylabel('x1(n)');
grid on;

%2.衰减正弦信号
n = 1:100;
A = 2;
alpha = 0.5;
f_0 = 50;
f_s = 1000;
x_2 = A*exp(-alpha*n/f_s).*sin(2*pi*f_0*n/f_s);
subplot(2,3,2)
plot(n,x_2);
xlabel('n');
ylabel('x2(n)');
grid on;

%3.谐波信号
%A_1 = 1;
%A_2 = 0.5;
%A_3 = 0.2;
n = 1:100;
f_s = 100;
f_0 = 5;
A = [1,0.5,0.2];
x_3 = 0;
for i = A
    x_3 = x_3+i*sin(2*pi*f_0*i*n/f_s);
end
subplot(2,3,3)
plot(n,x_3);
xlabel('n')
ylabel('x3(n)');
grid on;

%4.Hamming窗
n = 1:100;
f_s = 100;
f_0 = 5;
x_4 = 0.54-0.46*cos(2*pi*f_0*n/f_s);
subplot(2,3,4)
plot(n,x_4);
xlabel('n')
ylabel('x4(n)');
grid on;

%5.sinc函数
f = 10;
omega = 2*pi*f;
n = 1:100;
f_s = 100;
w = omega*n/f_s;
x_5 = sinc(w);
subplot(2,3,5)
plot(n,x_5);
xlabel('n')
ylabel('x5(n)');
grid on;
