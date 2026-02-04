clc
clear all
close all

T=1;N=1000;
M=10000;
dt=T/N;
t=0:dt:T;
for i=1:M
    B=[0 cumsum(sqrt(dt)*randn(1,N))];
    area(i)=trapz(t,B);
end

mu=0;sigma=sqrt(1/3);
x=linspace(min(area),max(area),100);

figure(1)
hold on
histogram(area,'Normalization','pdf')
plot(x,normpdf(x,mu,sigma),'r','linewidth',2)
xlabel('Area'); ylabel('Probability distribution');
title('Histogram area under BM')
legend('Simulated','Theoritical')

figure(2)
hold on
histogram(area,'Normalization','cdf')
plot(x,normcdf(x,mu,sigma),'r','linewidth',2)
xlabel('Area'); ylabel('Probability distributio');
title('Cumulative histogram area under BM')
legend('Simulated','Theoritical')