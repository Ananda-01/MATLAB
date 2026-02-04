clc
clear all
close all

mu=2; sigma=1; x0=1;
T=1; N=500;
dt=T/N;
t=0:dt:T;
w=[0 cumsum(sqrt(dt)*randn(1,N))];
x_EM=zeros(1,N);
x_EM(1)=x0;

for i=2:N+1
    x_EM(i)=x_EM(i-1) + mu*x_EM(i-1)*dt + sigma*x_EM(i-1)*(w(i)-w(i-1));
end

x_exact=x0*exp( (mu-0.5*sigma^2)*t + sigma*w );
plot(t,x_EM,'b',t,x_exact,'r')
legend('Euler-Maruyama','Exact')
xlabel('t')
ylabel('x(t)')
title('Geometric Brownian motion')