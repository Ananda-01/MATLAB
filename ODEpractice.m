%ODE 6
clc
clear all
close all
syms p p0 k r t
r=0.71;
k=106;
p0=0.25*k;
p(t)=(k*p0)/(p0+(k-p0)*exp(-r*t));
sol=solve(p(t)==0.75*k,t)
sol1=solve(diff(p,2)==0,t)
time=p(2)
fplot(p(t),'color','r')
hold on
fplot(sol,p(sol),'*k')
fplot(sol1,p(sol1),'*g')
fplot(2,p(2),'*b')

%%
% 5 a
clc
clear all
close all
F=@(x,y)(x+2*y)
[x y]=ode45(F,[0 -1/4],1)
plot(x,y)

%%
% 5 b
function f=odefun(s,x0,y0)
sums y(x)
sol=dsolve(diff(y)==s,y(x0)==y0)
end 
%%
% 2 a
clc
clear all
close all
syms x y
[x,y]=meshgrid(-10:.85:10,-10:0.85:10);
f=(exp(-x)-y).*(exp(-x)+2+y);
m=sqrt(1+f.^2);
quiver(x,y,1./m,f./m)
axis tight
clear x y
F=@(x,y)(exp(-x)-y)*(exp(-x)+2+y)
y0=[3,-2,0]
for k=1:length(y0)
    [x1,y1]=ode45(F,[2 10],y0(k))
    [x2,y2]=ode45(F,[2 -10],y0(k))
    X=[flip(x1);x2]
    Y=[flip(y1);y2]
    hold on
    plot(X,Y,'linewidth',4)
end
axis([-10 10 -10 10])
%%
%Practice 2 a
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
F=@(x,y)(exp(-x)-y)*(exp(-x)+2+y)
y0=[2,3,-1]
for i=1:length(y0)
    [x1,y1]=ode45(F,[2 10],y0(i))
    [x2,y2]=ode45(F,[2 -10],y0(i))
    X=[flip(x1);x2]
    Y=[flip(y1);y2]
    hold on 
    plot(X,Y,'linewidth',5)
end
axis([-10 10 -10 10])

%%
% 4 
clc
clear all
close all
syms y(x)
Dy=diff(y,1)
Dyy=diff(y,2)
cond=y(0)==-1; 
cond1=Dy(0)==2;
eqn=(4*Dyy+4*Dy+17*y)
sol=dsolve(eqn,cond,cond1)
fplot(sol)

%%
% 1
clc
clear all
close all
syms x y
[x,y]=meshgrid(-10:.75:10,-10:.75:10)
dydx=y/5;
quiver(x,y,ones(size(dydx)),dydx)
axis tight
clear x y
syms y(x)
hold on
sol=dsolve(diff(y)==y/5,y(0)==1)
fplot(sol,'linewidth',2,'color','y')
plot(0,1,'o','Markerfacecolor','r','Markersize',6)
%%
% 3
clc
clear all
close all
syms x y 
[x,y]=meshgrid(-10:0.75:10,-10:0.75:10)
dydx=x+2*y
quiver(x,y,ones(size(dydx)),dydx)
axis tight
clear x y
F=@(x,y)(x+2*y)
y0=[0,-1/4,1]
for i=1:length(y0)
    [x1,y1]=ode45(F,[0 2],y0(i))
    [x2,y2]=ode45(F,[0 -1],y0(i))
    X=[flip(x1);x2]
    Y=[flip(y1);y2]
    hold on
    plot(X,Y,'linewidth',4)
end
axis([-10 10 -10 10])
%%
% 6 practice
clc
clear all
close all
syms r k p0 t p
r=0.71;
k=106;
p0=0.25*k;
p(t)=(k*p0)/(p0+(k-p0)*exp(-r*t));
sol=solve(p(t)==0.75*k,t)
sol1=solve(diff(p,2)==0,t)
time=p(2)
fplot(p(t))
hold on
plot(sol,p(sol),'*k')
plot(sol1,p(sol1),'*g')
plot(2,p(2),'*r')










