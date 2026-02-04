% Plot the solution trajactories
clc
clear all
close all

a=0.8; b=0.8; c=0.4; d=0.2; delta=5.3979;
k=3; l=3; m=0.1;
x0=1.52; y0=2;

N=10;
t=0:1:N;
x=zeros(1,N);
y=zeros(1,N);
x(1)=x0;
y(1)=y0;

syms u v
f1(u,v)=u+delta*u*(a*(1-u/k)-b*u*v/(u+l));
f2(u,v)=v+delta*v*(-d*v+c+m*u*v/(u+l));

for n=1:N
    x(n+1)=f1(x(n),y(n));
    y(n+1)=f2(x(n),y(n));
end

hold on
plot(t,x,'bo-','linewidth',2)
plot(t,y,'ro-','linewidth',2)
legend('Prey(x)','Predator(y)')
xlabel('Time step')
ylabel('Population')
title('Predator-prey population dynamics')

%%
% Stability analysis
clc
clear all
close all

syms x y
a=0.8; b=0.8; c=0.4; d=0.2; delta=5.3979;
k=3; l=3; m=0.1;
f1(x,y)=x+delta*x*(a*(1-x/k)-b*x*y/(x+l));
f2(x,y)=y+delta*y*(-d*y+c+m*x*y/(x+l));
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
% Phase portrait different values of delta
clc
clear all
close all

delta_val=[0.1 1 3 5 5.3979 6];
a=0.8; b=0.8; c=0.4; d=0.2;
k=3; l=3; m=0.1;
x0=1.52; y0=2;
N=10;

for i=1:length(delta_val)
    delta=delta_val(i);
    x=zeros(1,N);
    y=zeros(1,N);
    x(1)=x0;
    y(1)=y0;
    
    syms u v
    f1(u,v)=u+delta*u*(a*(1-u/k)-b*u*v/(u+l));
    f2(u,v)=v+delta*v*(-d*v+c+m*u*v/(u+l));

    for n=1:N
       x(n+1)=f1(x(n),y(n));
       y(n+1)=f2(x(n),y(n));
    end

    subplot(2,3,i)
    hold on
    plot(x,y,'bo-','linewidth',1.5);
    axis tight
    xlabel('Prey population')
    ylabel('Predator population')
    title('Phase portrait for delta')
end




