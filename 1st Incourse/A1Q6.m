clc
clear all 
close all

x = linspace(0, 1, 50);
t = linspace(0, 2, 100); 
m = 0;
sol = pdepe(m, @pdefun, @icfun, @bcfun, x, t);
u = sol(:,:,1);
v = sol(:,:,2);

% Plot results
figure(1)
subplot(2,1,1);
surf(x, t, u);
title('Solution for u(x,t)');
xlabel('x'); ylabel('t'); zlabel('u');
shading interp; colorbar;

subplot(2,1,2);
surf(x, t, v);
title('Solution for v(x,t)');
xlabel('x'); ylabel('t'); zlabel('v');
shading interp; colorbar;



