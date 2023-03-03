L = 100;
N = L/2;
nx = 0:N-1;
ny = 0:L-2;
f_s = 100;
x = exp(-nx/f_s);
y = conv(x,x);
subplot(2,1,1)
stem(nx,x,'.');
xlabel('nx');
ylabel('x');
subplot(2,1,2)
stem(ny,y,'.');
xlabel('ny');
ylabel('y');
