clc
clear all
close all

syms x
% fixed values
r=0.5; k=100;
f(x)=x+r*x*(1-x/k);
FP=solve(f==x);
J(x)=jacobian(f,x);

for i=1:length(FP)
    fp=double(FP(i));
    z=double(J(fp));
    if abs(z)<1
        disp(['The fixed point ',num2str(fp), ' is stable'])
    else
        disp(['Fixed point ',num2str(fp),' is unstable'])
    end
end

%%
% Plot the solution trajectory(Orbit)
clc
clear all
close all

syms x
r=0.5; k=100; N=50; P0=10;
f(x)=x+r*x*(1-x/k);
P=zeros(1,N);
P(1)=P0;
for n=1:N
    P(n+1)=f(P(n));
end
t=0:1:N;
plot(t,P,'-o','linewidth',2)
xlabel('time step')
ylabel('Population')
title('Discrete time logistic model solution trajectory')

%%
% Solution trajectories different values of r
clc
clear all
close all

R=[0.4 1.0 1.6 2.2 2.5 3]; P0=10; N=50; k=100;
for i=1:6
    r=double(R(i));
    f=@(x) x+r*x*(1-x/k);
    P=zeros(1,N);
    P(1)=P0;
    for n=1:N
        P(n+1)=f(P(n));
    end
    t=0:1:N;
    subplot(2,3,i)
    plot(t,P,'o-','Linewidth',2)
    title(['Behavior for r=',num2str(r)]);
end
    



