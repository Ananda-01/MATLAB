clc
clear all
close all

% Milstein method offers a better convergence compared to EM method
% Now use the Milstein method to solve the GBM SDE given in Task(5) 

mu=2; sigma=1; x0=1;
T=1; N=1000;
dt=T/N;
t=0:dt:T;
w=[0 cumsum(sqrt(dt)*randn(1,N))];
x=zeros(1,N);
x(1)=x0;

for i=2:N+1
    dw=w(i)-w(i-1);
    x(i)=x(i-1) + mu*x(i-1)*dt + sigma*x(i-1)*dw + 0.5*sigma^2*x(i-1)*(dw^2-dt);
end

x_exact=x0*exp( (mu-0.5*sigma^2)*t + sigma*w );
plot(t,x,'b',t,x_exact,'r--')
legend('X-Milstein','X-exact')
xlabel('t')
ylabel('x(t)')
title('Milstein method to solve GBM SDE')
    