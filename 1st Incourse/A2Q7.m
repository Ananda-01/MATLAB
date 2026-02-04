clc
clear all
close all

sigma=1; lamda=2; x0=1;
T=1; N=1000;
dt=T/N;
t=0:dt:T;
w=[0 cumsum(sqrt(dt)*randn(1,N))];
x_EM=zeros(1,N+1);
x_EM(1)=x0;

for i=2:N+1
    x_EM(i)=x_EM(i-1) - lamda*x_EM(i-1)*dt + sigma*(w(i)-w(i-1));
end

plot(t,x_EM)
xlabel('t')
ylabel('x(t)')
title('Ornstein-Uhlenbeck SDE using EM')
