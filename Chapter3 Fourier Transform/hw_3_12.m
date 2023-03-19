clear;

T=1;tao1=0.2*T;A=5;
s=pi*tao1/T;
A1=A*tao1/T;
for k=1:60
   k1=k-30;
   sk1=s*k1;
   if sk1==0
      x(k)=1;
   else
      x(k)=sin(sk1)/sk1;
      end 
end
k=-29:30;   
subplot(311)
stem(k,x,'.');
hold
plot(k,zeros(size(x)));

T=1;tao2=0.1*T;A=5;
s=pi*tao2/T;
A1=A*tao2/T;
for k=1:60
   k1=k-30;
   sk1=s*k1;
   if sk1==0
      x(k)=1;
   else
      x(k)=sin(sk1)/sk1;
      end 
end
k=-29:30; 
subplot(312)
stem(k,x,'.')
hold
plot(k,zeros(size(x)))

T=1;tao3=0.05*T;A=5;
s=pi*tao3/T;
A1=A*tao3/T;
for k=1:60
   k1=k-30;
   sk1=s*k1;
   if sk1==0
      x(k)=1;
   else
      x(k)=sin(sk1)/sk1;
      end 
end
k=-29:30; 
subplot(313)
stem(k,x,'.')
hold
plot(k,zeros(size(x)))