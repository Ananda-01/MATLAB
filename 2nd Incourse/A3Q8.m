clc 
clear all
close all
% Solution trajectories

s=10; r=28; b=8/3;
x0=1; y0=1; z0=1;
tspan=[0;60];
Lorenz=@(t,x) [s*(-x(1)+x(2)); r*x(1)-x(2)-x(1)*x(3); x(1)*x(2)-b*x(3)];
ic=[x0;y0;z0];
[t,X]=ode45(Lorenz,tspan,ic);
x=X(:,1);
y=X(:,2);
z=X(:,3);

% for better plotting
t=t(1:300);
x=x(1:300);
y=y(1:300);
z=z(1:300);

hold on
plot(t,x,'b','linewidth',2,'DisplayName','x(t)')
plot(t,y,'r','linewidth',2,'DisplayName','y(t)')
plot(t,z,'k','linewidth',2,'DisplayName','z(t)')
title('Solution trajactories of the Lorenz system')

%%
% Phase portrait
clc
clear all
close all

s=10; r=28; b=8/3;
x0=1; y0=1; z0=1;
tspan=[0;60];
Lorenz=@(t,x) [s*(-x(1)+x(2)); r*x(1)-x(2)-x(1)*x(3); x(1)*x(2)-b*x(3)];
ic=[x0;y0;z0];
[t,X]=ode45(Lorenz,tspan,ic);
x=X(:,1);
y=X(:,2);
z=X(:,3);

plot3(x,y,z,'b')
xlabel('x'); ylabel('y'); zlabel('z')
title('Phase portrait of Lorenz system')


%%
% Stability analysis of the Lorenz system
clc
clear all
close all

sigma=10; rho=28; beta=8/3;
syms x y z
f1=sigma*(-x+y);
f2=rho*x-y-x*z;
f3=x*y-beta*z;

F=[f1;f2;f3];
var=[x;y;z];
J(x,y,z)=jacobian(F,var);
[X,Y,Z]=solve([f1==0; f2==0; f3==0]);

for i=1:length(X)
    a=double(X(i));
    b=double(Y(i));
    c=double(Z(i));
    j_val=J(a,b,c);
    e=eig(j_val);
    fprintf('Fixed point (%0.2f %0.2f %0.2f ) \n',a,b,c)
    
    if all(real(e)<0) && imag(e)==0
        disp('Asymtotically stable node')
    elseif all(real(e)<0) && any(imag(e)~=0)
        disp('Stable spiral sink')
    elseif any(real(e)>0) && any(imag(e)<0)
        disp('Unstable and saddle point')
    elseif all(real(e)>0)
        disp('Unstable and source')
    elseif all(real(e)==0)
        disp('Neutrally stable')
    else
        disp('Stability is underminded')
    end
end




