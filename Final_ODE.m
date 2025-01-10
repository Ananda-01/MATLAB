% 1
clc
clear all
close all
syms x
[x,y]=meshgrid(-5:.75:5,-5:.75:5);
% for directional field
f=y/5;
m=sqrt(1+f.^2);
quiver(x,y,1./m,f./m)
axis tight
clear x y
syms y(x)
hold on
fplot(dsolve(diff(y)==y/5,y(0)==1))% solve DE
plot(0,1,'o','Markerfacecolor','k') % point plot

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
syms x y
F=@(x,y) (exp(-x)-y).*(exp(-x)+2+y);
y0=[1,-2,3];
for i=1:length(y0)
    [x1,y1]=ode45(F,[2,10],y0(i));
    [x2,y2]=ode45(F,[-2,10],y0(i));
    X=[flip(x1);x2];
    Y=[flip(y1);y2];
    hold on
    plot(X,Y,'linewidth',4)
end
axis([-8 8 -8 8])

%% 
% 3
clc
clear all
close all
syms x y
[x,y]=meshgrid(-5:.85:5,-5:.85:5);
f=x+2*y
m=sqrt(1+f.^2);
quiver(x,y,1./m,f./m)
axis tight
clear x y
syms x y
F=@(x,y) x+2*y;
y0=[0 -1/4 1/4];
hold on
for i=1:length(y0)
    [x1,y1]=ode45(F,[0,10],y0(i));
    [x2,y2]=ode45(F,[0,10],y0(i));
    X=[flip(x1);x2];
    Y=[flip(y1);y2];
    hold on
    plot(X,Y,'linewidth',3)
end
axis([-5 5 -5 5])

%%
% 4
clc
clear all
close all
syms y(x)
Dy=diff(y,1);
Dyy=diff(y,2);
cond=y(0)==-1;
cond1=Dy(0)==2;
eqn=4*Dyy+4*Dy+17*y;
sol=dsolve(eqn,cond,cond1)
fplot(sol,'linewidth',2)

%%
% 5 a
clc
clear all
close all
syms x y
[x,y]=meshgrid(-5:.75:5,-5:.75:5);
f=x+2*y;
m=sqrt(1+f.^2);
quiver(x,y,1./m,f./m);
axis tight
clear x y
syms y(x)
F=@(x,y) x+2*y
y0=[-2,-1,-1/4,1,2];
t0=[-1,-1,0,1,1];
for i=1:length(y0)
    [x1,y1]=ode45(F,[t0(i),5],y0(i));
    [x2,y2]=ode45(F,[t0(i),-5],y0(i));
    X=[flip(x1);x2];
    Y=[flip(y1);y2];
    hold on
    plot(X,Y,'linewidth',3)
end
axis([-5 5 -5 5])

%%
% 5 b
clc
clear all
close all
syms y(x)
dsolve(odefun(x,y)==0,y(0)==-1/4)

%% 
% 6
clc
clear all
close all
syms r p p0 k t
r=0.71;
k=106;
p0=0.25*k;
p(t)=k*p0/(p0+(k-p0)*exp(-r*t))
t1=p(2) % biomass after 2 years
sol=solve(p(t)==0.75*k,t)
sol1=solve(diff(p(t),2)==0,t)
% ploting
fplot(p(t),'g')
hold on
plot(sol,p(sol),'k*')
plot(sol1,p(sol1),'b*')
plot(2,p(2),'r*')

%%
% practice 6
clc
clear all
close all
syms r k p0 p t
r=0.71;k=106;p0=0.25*k;
p(t)=k*p0/(p0+(k-p0)*exp(-r*t))
time=p(2)
sol=solve(p(t)==0.75*k,t)
sol1=solve(diff(p(t),2)==0,t)
fplot(p(t),'y')
hold on
plot(2,p(2),'k*')
plot(sol,p(sol),'r*')
plot(sol1,p(sol1),'g*')

%%
% 2
clc
clear all
close all
syms x y
[x,y]=meshgrid(-5:.73:5,-5:.73:5)
f=(exp(-x)-y).*(exp(-x)+2+y)
m=sqrt(1+f.^2)
quiver(x,y,1./m,f./m)
axis tight
clear x y
syms y(x)
F=@(x,y) (exp(-x)-y)*(exp(-x)+2+y)
y0=[-1 1 1.5 2 2.5 3]
for i=1:length(y0)
    [x1,y1]=ode45(F,[2,10],y0(i))
    [x2,y2]=ode45(F,[2,-10],y0(i))
    X=[flip(x1);x2]
    Y=[flip(y1);y2]
    hold on
    plot(X,Y,'linewidth',2)
end
axis([-10 10 -10 10])


    














