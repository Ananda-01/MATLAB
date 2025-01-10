syms x
y = 2*x - 5*x^(3/4);
f1 = diff(y,1)
f2 = diff(y,2)
fplot(f1)
hold on
fplot(f2)


%%
syms x
y = exp(x) - x^3;
f1 = diff(y,1)
f2 = diff(y,2)
fplot(f1)
hold on
fplot(f2)
grid on
axis tight

%%
syms x
f(x) = sqrt(x);
a=0;
b=4;
f1 = diff(f,1)
f2 = diff(f,2)
c=solve((f(b)-f(a))/(b-a)==f1,x)
t(x)=f(c)+f1(c).*(x-c)
s(x)=(((x-a)*(f(a)-f(b)))/(a-b))+f(a)
fplot(f(x),'color','k','linewidth',2)
hold on
fplot(t(x),'color','g','linewidth',2)
hold on
fplot(s(x),'color','y','linewidth',2)
hold on
plot(c,f(c),'o','Markerfacecolor','b','Markersize',8)

%%
% Ques_N0-2(b)
clc
clear all
close all
syms x
f(x) =x^3+x-4;
a=1;
b=2;
f1 = diff(f,1)
f2 = diff(f,2)
c=solve((f(b)-f(a))/(b-a)==f1,x)
t(x)=f(c)+f1(c).*(x-c)
s(x)=((x-a)*(f(a)-f(b)))/(a-b)+f(a)
fplot(f(x),'color','k','linewidth',2)
hold on
fplot(t(x),'color','g','linewidth',2)
hold on
fplot(s(x),'color','y','linewidth',2)
hold on
plot(c,f(c),'o','Markerfacecolor','r','Markersize',8)



%%
% Ques_No-2(c)
syms x
f(x)=36*x+3*x^2-2*x^3
f1=diff(f,x,1)
f2=diff(f,x,2)
s1=solve(f1==0,x)
s2=solve(f2==0,x)
fplot(f(x),'color','y','linewidth',6)
hold on
fplot(f1,'color','k','linewidth',6)
fplot(f2,'color','g','linewidth',6)
plot(s1,f(s1),'o','Markerfacecolor','b','Markersize',8)
%increasing -2<x<3
plot(s2,f(s2),'o','Markerfacecolor','r','Markersize',8)
%x<1/2 is concave up and x>1/2 is concave down
axis([-10 10 -100 100])


%%
syms x y
f=(x^2-2*x)*exp(-x^2-y^2-x*y)
px=diff(f,x,1)
py=diff(f,y,1)

%%
syms x y z
f=sin(x^2*y)*exp(-x^2*y-z^2)
pxyz=diff(diff(diff(f,x,2),y,1),z,1)

























