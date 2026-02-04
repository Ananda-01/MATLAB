clc ; 
clear all ; 
close all;

syms x y a;
% Given velocity components
u = -2*(x^2 - y^2);
v = 4*a*x*y;

% Calculate the stream function
I = int(-v,x);
dg_dy = u - diff(I,y);
G = int(dg_dy,y);
psi = simplify(I+G);
fprintf('%s(x)=%s\n',char(936),char(psi));

figure(1);
hold on
% fcontour(psi,'levellist',[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10],'meshdensity',300,'linewidth',1.5)

clear x y
[x,y]=meshgrid(-5:0.5:5,-5:0.5:5);
u = -2.*(x.^2 - y.^2);
v = 4.*x.*y;
nrm=sqrt(u.^2+v.^2);
u=u./nrm;v=v./nrm;
% Velocity field
quiver(x,y,u,v,'r')
% Streamline
streamslice(x,y,u,v)
xlabel('x');
ylabel('y');
title('Velocity field with streamlines')
axis tight