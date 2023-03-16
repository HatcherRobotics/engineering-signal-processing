for n1 = 1:51
    x(n1)=(n1-1)/5;
end
for n1 = 51:99
    x(n1)=20-n1/5;
end
n2 = 0:2;
h = 1./(2.^n2);
y = fftfilt(h,x);
stem(y)