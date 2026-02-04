clc
clear all
close all

x=linspace(0,1,50);
t=linspace(0,1,100);
m=0;
sol=pdepe(m,@pdefun5,@icfun5,@bcfun5,x,t);
u=sol(:,:,1);

surf(x,t,u)
xlabel('Position'); ylabel('Time'); zlabel('Temperature')
title('Heat distribution in the rod')
colorbar
shading interp

figure(2)
plot(x,u(100,:)) % when time is fixed
figure(3)
plot(t,u(:,10)) % when displacement x is fixed