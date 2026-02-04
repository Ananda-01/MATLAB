clc ; 
clear all ; 
close all;

syms x y z;
u = -2*(x^2 - y^2);
v = 4*x*y;

q=[u,v,0];
vars=[x,y,z];
div=divergence(q,vars);
crl=curl(q,vars);

% Possibility of motion 
if div==0
    disp('q is a possible motion for an incompressible fluid.')
else
     disp('q is not a possible motion for an incompressible fluid.')
end

%Existance of stream functoin
if div==0
    disp('Steam function exists.')
else
     disp('Steam function does not exist.')
end

% Existence of velocity potential
if crl==0
    disp('Velocity potential exists.')
else
     disp('Velocity potential does not exist.')
end

%Calculate the stream function
I = int(-v,x);
dg_dy = u - diff(I,y);
G = int(dg_dy,y);
psi = simplify(I+G);
fprintf('%s(x)=%s\n',char(936),char(psi))

% Calculate velocity potential
J = int(u,x);
dh_dy = v - diff(J,y);
H = int(dh_dy,y);
phi = simplify(J+H);
fprintf('%s(x)=%s\n',char(934),char(phi))

figure(1);
hold on
fcontour(psi,'r','levellist',[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10],'meshdensity',300,'linewidth',1.5)
fcontour(phi,'b','levellist',[-10,-9,-8,-7,-6,-5,-4,-3,-2,-1,0,1,2,3,4,5,6,7,8,9,10],'meshdensity',300,'linewidth',1.5)
xlabel('x');
ylabel('y');
grid on
title('Streamlines (Red) and Equipotential Lines(Blue)')
