% 1
clc
clear all
close all
syms x
[x,y]=meshgrid(-5:.75:5,-5:.75:5)
dydx=y/5
quiver(x,y,ones(size(dydx)),dydx)
axis tight
clear x y
syms y(x)
hold on
fplot(dsolve(diff(y)==y/5,y(0)==1))


%%
% 2
clc
clear all 
close all
syms x y 
[x,y]=meshgrid(-10:.75:10,-10:.75:10);
f=(exp(-x)-y).*(exp(-x)+2+y);
m=sqrt(1+f.^2);
quiver(x,y,1./m,f./m)
axis tight
clear x y
syms x
F=@(x,y)(exp(-x)-y)*(exp(-x)+2+y);
y0=[1,-2,3];
for i=1:length(y0)
    [x1,y1]=ode45(F,[2 10],y0(i));
    [x2,y2]=ode45(F,[2 -10],y0(i));
    X=[flip(x1);x2];
    Y=[flip(y1);y2];
    hold on
    plot(X,Y,'linewidth',4)
end
axis ([-10 10 -10 10])

%%
% 3 
clc
clear all
close all
syms x
[x,y]=meshgrid(-10:.75:10,-10:.75:10)
f=x+2*y
quiver(x,y,ones(size(f)),f)
axis tight
clear x y
syms y(x)
F=@(x,y)(x+2*y)
y0=[0,-1,1]
for i=1:length(y0)
    [x1,y1]=ode45(F,[-1 2],y0(i))
    [x2,y2]=ode45(F,[-1 -2],y0(i))
    X=[flip(x1);x2]
    Y=[flip(y1);y2]
    hold on
    plot(X,Y,'linewidth',3)
end
axis([-10 10 -10 10])

%%
% 4
clc
clear all
close all
syms y(x)
Dy=diff(y)
Dyy=diff(y,2)
eqn=4*Dyy+4*Dy+17*y
cond=y(0)==-1;
cond1=Dy(0)==2
sol=dsolve(eqn,cond,cond1)
fplot(sol)

%%
% 5
clc 
clear all
close all
syms x y
F=@(x,y)(x+2*y)
tspan=[0 -1/4]
[x,y]=ode45(F,tspan,1)
plot(x,y)
%%
% 6
clc
clear all 
close all
syms r k p p0 t
r=0.71;
k=106;
p0=0.25*k;
p(t)=(k*p0)/(p0+(k-p0)*exp(-r*t))
sol=solve(p(t)==0.75*k,t)
sol1=solve(diff(p,2)==0,t)
time = p(2)

fplot(p(t),'color','y')
hold on
plot(sol,p(sol),'*k')
plot(sol1,p(sol1),'*b')
plot(2,p(2),'*r')


%%
% 2
clc
clear all
close all
syms x y 
[x,y]=meshgrid(-10:.75:10,-10:.75:10)
f=(exp(-x)-y).*(exp(-x)+2+y)
m=sqrt(1+f.^2)
quiver(x,y,1./m,f./m)
axis tight
clear x y
syms x
F=@(x,y)(exp(-x)-y)*(exp(-x)+2+y)
y0=[1,-2,3]
for i=1:length(y0)
    [x1,y1]=ode45(F,[2 10],y0(i))
    [x2,y2]=ode45(F,[2 -10],y0(i))
    X=[flip(x1);x2]
    Y=[flip(y1);y2]
    hold on
    plot(X,Y,'linewidth',4)
end
axis([-10 10 -10 10])





