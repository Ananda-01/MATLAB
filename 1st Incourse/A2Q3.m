clc
clear all
close all

N=1000; T=1;
M=10; phi=3;
dt=T/N;
t=0:dt:T;

for i=1:M
    B=[0 cumsum(sqrt(dt)*randn(1,N))];
    z(i,:)=exp(-phi*B - 0.5*phi^2*t);
end

zavg=mean(z);
hold on
plot(t,z)
plot(t,zavg,'r','linewidth',2)
legend('show')

%legend(arrayfun(@(i)['Path',num2str(i)],1:M,'UniformOutput',false),'Average Path')
