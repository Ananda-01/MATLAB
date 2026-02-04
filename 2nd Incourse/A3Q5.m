% Discrete predator-prey model
% Plot the solution trajectories
clc
clear all
close all

a=1.5; b=0.5; g=0.4; d=0.2;
x0=0.2; y0=0.1; % intial values
N=50; % time steps
t=0:1:N;

% Preallocate
x=zeros(1,N);
y=zeros(1,N);
x(1)=x0;
y(1)=y0;

syms u v
f1(u,v)=a*u*(1-u)-b*u*v;
f2(u,v)=d*u*v-g*v;

for n=1:N
    x(n+1)=f1(x(n),y(n));
    y(n+1)=f2(x(n),y(n));
end

hold on
plot(t,x,'b-','linewidth',2,'DisplayName','Prey (x)')
plot(t,y,'r-','linewidth',2,'DisplayName','Predator (y)')
legend show
xlabel('Time step')
ylabel('Population')
title('Predator-prey population dynamics')

%%
% Stability analysis
clc
clear all
close all

syms x y
a=1.5; b=0.5; g=0.4; d=0.2;
f1(x,y)=a*x*(1-x)-b*x*y;
f2(x,y)=d*x*y-g*y;
F=[f1;f2];
var=[x;y];
J(x,y)=jacobian(F,var);
[X,Y]=solve([f1==x; f2==y]); % Fixed points
for i=1:length(X)
    p=X(i);
    q=Y(i);
    J_val=J(p,q);
    e=eig(J_val);
    fprintf('Fixed point (%0.2f, %0.2f)\n',p,q)
    
    if all(abs(e)<1)
        disp('Asymtotically stable')
    elseif any(abs(e)>1)
        disp('Unstable')
    else any(abs(e)==1)
        disp('Need further analysis to determine stability')
    end
end

%%
% Phase plane for different values of alpha
clc
clear all
close all

b=0.5; g=0.4; d=0.2;
A=[0.5,1,1.5,2];
x0=0.2; y0=0.1;
N=10;
t=0:1:N;

for i=1:length(A)
    a=A(i);
    x=zeros(1,N+1);
    y=zeros(1,N+1);
    x(1)=x0;
    y(1)=y0;
    
    syms u v
    f1(u,v)=a*u*(1-u)-b*u*v;
    f2(u,v)=d*u*v-g*v;
    
    for n=1:N
        x(n+1)=f1(x(n),y(n));
        y(n+1)=f2(x(n),y(n));
    end
    
    subplot(2,2,i)
    plot(x,y,'bo-','linewidth',1.5)
    xlabel('Prey population xn')
    ylabel('Predator population yn')
    title('Phase plane diagram for varying alpha')
end
