clc
clear all
close all

% Solution trajectories
a=2; b=0.5; c=0.5; d=0.5; e=1; f=1; g=1;
x1_0=100; x2_0=40; y0=30;
tspan=[0;5];
Lorenz=@(t,x) [a*x(2)-b*x(1)-c*x(1); b*x(1)-d*x(2)-e*x(2)*x(3); -f*x(3)-g*x(2)*x(3)];
ic=[x1_0; x2_0;y0];
[t,X]=ode45(Lorenz,tspan,ic);
x1=X(:,1);
x2=X(:,2);
y=X(:,3);

hold on
plot(t,x1,'b','linewidth',2,'DisplayName','Juvenile prey x1')
plot(t,x2,'r','linewidth',2,'DisplayName','Adult prey x2')
plot(t,y,'k','linewidth',2,'DisplayName','Predator y')
xlabel('time(t)'); ylabel('value');
legend show
title('Solution trajectoreis of the system')







