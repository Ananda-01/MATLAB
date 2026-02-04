clc
clear all
close all

% Plot solution trajectories
a=3; % infection rate
b=0.5; % recovery rate

% initial condition
s0=0.99; i0=0.01; r0=0.0;
tspan=[0;30];

% s=x(1), i=x(2), r=x(3)
sir=@(t,x) [-a*x(1)*x(2); a*x(1)*x(2)-b*x(2); b*x(2)];
ic=[s0;i0;r0];
[t,X]=ode45(sir,tspan,ic);
s=X(:,1);
i=X(:,2);
r=X(:,3);

hold on
plot(t,s,'k','linewidth',2,'DisplayName','Susceptible')
plot(t,i,'r','linewidth',2,'DisplayName','Infected')
plot(t,r,'b','linewidth',2,'DisplayName','Recovery')
axis tight
xlabel('time')
ylabel('Proportion of population')
title('Solution trajactories of the SIR model')

%%
clc
clear all
close all

% Solution trajactories
A=[1,2,3,4];
b=0.5; % Recovery rate

% initial condition
s0=0.99; i0=0.01; r0=0.0;
tspan=[0;30];
ic=[s0;i0;r0];
for j=1:length(A)
    a=A(j);
    % s=x(1), i=x(2), r=x(3)
    sir=@(t,x) [-a*x(1)*x(2); a*x(1)*x(2)-b*x(2); b*x(2)];
    [t,X]=ode45(sir,tspan,ic);
    s=X(:,1);
    i=X(:,2);
    r=X(:,3);

     subplot(2,2,j)
     hold on
     plot(t,s,'k','linewidth',2,'DisplayName','Susceptible')
     plot(t,i,'r','linewidth',2,'DisplayName','Infected')
     plot(t,r,'b','linewidth',2,'DisplayName','Recovery')
     legend show
     axis tight
     xlabel('time')
     ylabel('Proportion of population')
     title('Solution trajactories of the SIR model')
end
