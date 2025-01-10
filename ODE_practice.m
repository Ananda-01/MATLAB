% 4 a b 
clc
clear all
close all
syms y(t)
Dy=diff(y);
Dyy=diff(y,2);
eqn=4*Dyy+4*Dy+17*y;
cond=y(0)==-1;
cond1=Dy(0)==2;
sol=dsolve(eqn,cond,cond1)
fplot(sol)

%%
clc
clear all
close all
% 5
syms x y
F=@(x,y)(x+2.*y)
[x y]=ode45(F,[0 -1/4],1);
plot(x,y)

%%
clc
clear all
close all
% 6
syms p t r k p0
r=0.71;
k=106;
p0=0.25*k;
p(t)=(k*p0)/(p0+(k-p0)*exp(-r*t));
sol=solve(diff(p,2)==0,t)
sol1=solve(p(t)==0.75*k,t)
p(2)
fplot(p,[0 10])
hold on 
fplot(2,p(2),'*r')
fplot(sol,p(sol),'*b')
hold on
fplot(sol1,p(sol1),'*k')
hold on



%%
% 1 a b
clc 
clear all
close all
syms x y
[x,y]=meshgrid(-8:.75:8);
dydx=y/5;
quiver(x,y,ones(size(dydx)),dydx)
clear x y
syms y(x)
hold on
fplot(dsolve(diff(y)==y/5,y(0)==1),'linewidth',2,'color','r')
plot(0,1,'o','Markerfacecolor','g')
xlabel('x')
ylabel('y')
axis tight





%%
% 2
clc
clear all
close all
[x,y]=meshgrid(-10:1:10,-10:1:10);
s=(exp(-x)-y).*(exp(-x)+2+y);
m=sqrt(1+s.^2)
quiver(x,y,1./m,s./m)
axis tight
clear x y
S=@(x,y)(exp(-x)-y)*(exp(-x)+2+y);
y0=[3,-2,0]
for k=1:length(y0)
    [x1 y1]=ode45(S,[2 10],y0(k))
    [x2 y2]=ode45(S,[2 -10],y0(k))
    X=[flip(x1);x2];
    Y=[flip(y1);y2];
    hold on
    plot(X,Y,'linewidth',3)
end
axis([-10 10 -10 10])




%%
% 
clc 
clear all
close all














