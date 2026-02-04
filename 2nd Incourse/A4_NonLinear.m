% Q2(a)

clc; 
close all; 
clear all;

diary('das.txt')
f = @(x) 100*( x(2) + 2*x(1)^2 ) + (1-3*x(1)^2);
x0 = [1,1];
[x,fval]=fminsearch(f,x0,optimset('PlotFcns',@optimplotfval,'TolX',1e-5,'Display','iter','MaxIter',50));
diary off
saveas(gcf,'a.png');



%% Part two: multiple starting points

clc
close all
clear all 

x1 = [-0.5  1  2  3];
x2 = [ 0.5  1  3  5]; 

for i=1:length(x1)
    x0 = [x1(i),x2(i)];
    global funval;
    funval=[];
    [x,fval] = fminsearch( @objfun, x0,  optimset('TolX', 1e-6, 'Display', 'iter','MaxIter',50));
    subplot(2,2,i)
    plot(funval,'b-d','linewidth',2)
end



    


%% Q2(b) 
clc; 
close all; 
clear all;

diary('anondo.txt')
a = 1; b = 7;
f = @(x) x^4 + 4*x^3 + 7*x^2 + 6*x;
[x, fval] = fminbnd(f, a, b, optimset('PlotFcns', @optimplotfval, 'TolX', 1e-6, 'Display', 'iter', 'MaxIter',100));
diary off
saveas(gcf, 'D.png');


