%Q4(i&ii&iii)
clc,
clear all
close all

syms x y
phi=x*y;
u=diff(phi,x);
v=diff(phi,y);

%Calculate stream function
I = int(-v,x);
dg_dy = u - diff(I,y);
G = int(dg_dy,y);
psi = simplify(I+G);
fprintf('%s(x)=%s\n',char(936),char(psi))

% flow rate between (0,1) and (2,1)
psi(x,y)=psi;
flowrate=psi(2,1)-psi(0,1);
disp(flowrate)

figure(1)
fcontour(psi,'b','levellist',[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10],'meshdensity',300,'linewidth',1.5)
xlabel('x');
ylabel('y');

% Plot the velocity field
clear x y
[x,y] = meshgrid(-5:5, -5:5);
u = y;
v = x;
nrm = sqrt(u.^2+v.^2);
u = u./nrm;
v = v./nrm;
figure(2)
quiver(x,y,u,v,'Linewidth',1.5)
xlabel('X')
ylabel('Y')
axis tight