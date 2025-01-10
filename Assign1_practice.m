% 1 i
syms x
f = 1/(1+exp(1/x))
fplot(f)
RHL=limit(f,x,0,'right')
LHL=limit(f,x,0,'left')
if(LHL==RHL)
    disp('limit exists')
else
    disp('limit does not exists')
end

%%
% 1 a iii
clc
clear all
close all
syms x
f = (exp(x^3)-1)/(1-cos(sqrt(x-sin(x))))
fplot(f)
LHL=limit(f,x,0,'left')
RHL=limit(f,x,0,'right')
if(LHL==RHL)
    disp('limit exists')
else
    disp('limit does not exists')
end
%%
% 1 b i
clc
clear all
close all
syms x 
f(x)=sqrt(9*x^2+x)-3*x
limit(f,x,inf)
%%
%1 b ii
clc
clear all
close all
syms x a b
f=(sqrt(x^2+a*x)-sqrt(x^2+b*x))
limit(f,x,inf)

%%
% 1 b iii
clc
clear all
close all
syms x y
f=(exp(-1/(x^2+y^2))*(sin(x)^2/x^2)*((1+1/y^2)^(x+4*y^2)))
limit(limit(f,x,1/sqrt(y)),y,inf)


%%
% 2 a
clc
clear all
close all
syms x
f=2*x-5*x^(3/4)
f1=diff(f,1)
f2=diff(f,2)
fplot(f,'color','r')
hold on 
fplot(f1,'color','g')
fplot(f2,'color','k')
xlabel('x')
ylabel('y')
legend('f, f1,f2')
%%
% 2 b
clc
clear all
close all
syms x
f(x)=x^3+x-4;
a=1;
b=2;
f1=diff(f,1);
f2=diff(f,2);
c=solve((f(b)-f(a))/(b-a) == f1,x)
t(x)=f(c) + f1(c).*(x-c)
s(x)=((x-a)*(f(a)-f(b)))/(a-b) + f(a)
fplot(f,'linewidth',3,'color','g')
hold on
fplot(t(x),'linewidth',5,'color','r')
fplot(s(x),'linewidth',3,'color','k')
plot(c,f(c),'o','Markerfacecolor','y')


%%
% 2 c
clc
clear all
close all
syms x
f(x)=36*x+3*x^2-2*x^3;
f1=diff(f,1)
f2=diff(f,2)
s1=solve(f1==0,x) %increasing function from -2 to 3
s2=solve(f2==0,x) %
fplot(f,'linewidth',3,'color','g')
hold on
fplot(f1,'linewidth',3,'color','y')
fplot(f2,'linewidth',3,'color','k')
plot(s2,f(s2),'o','Markerfacecolor','b','Markersize',8)
plot(s1,f(s1),'o','Markerfacecolor','r','Markersize',8)
axis([-10 10 -100 100])

%%
% 2 d
clc
clear all
close all
syms x y
f=(x^2-2*x)*(exp(-x^2-y^2-x*y))
fx=diff(f,x)
fy=diff(f,y)
%%
%2 d ii
clc
clear all
close all
syms x y z
f=sin(x^2*y)*exp(-x^2*y - z^2)
diff(diff(diff(f,x,2),y),z)
%%
% 2 b i
clc
clear all
close all
syms x
f(x)=sqrt(x);
a=0;
b=4;
f1=diff(f,1);
c=solve((f(b)-f(a))/(b-a) == f1,x)
t(x)=f(c) + f1(c)*(x-c)
s(x)=f(a) + ((x-a)*(f(a)-f(b)))/(a-b)
fplot(f,'linewidth',4,'color','g')
hold on
fplot(s(x),'linewidth',4,'color','k')
fplot(t(x),'linewidth',4,'color','r')
plot(c,f(c),'o','Markerfacecolor','b','Markersize',6)
xlabel('x')
ylabel('y')
title('Secant line and tangent line')

%% 
% 3
clc
clear all
close all
syms x
f=sqrt(x-1)
g=x-1
fplot(f,'color','y','linewidth',4)
hold on
fplot(g,'color','b','linewidth',4)
solve(f==g,x)
area=int(f-g,x,-1,2)
x=1:.01:2
f1=sqrt(x-1)
g1=x-1
x1=[x,flip(x)]
y1=[f1,flip(g1)]
fill(x1,y1,'c')
%%
% 3 ii
clc
clear all
close all
syms y(x)
f=cos(x)
g=1-cos(x)
fplot(f,'color','y','linewidth',4)
hold on
fplot(g,'color','b','linewidth',4)
solve(f==g,x)
area=int(f-g,x,0,pi/3)
x=-pi/3:.01:pi/3
f1=cos(x)
g1=1-cos(x)
x1=[flip(x),x]
y1=[flip(f1),g1]
fill(x1,y1,'k')
legend('f','g')

%%
% 3 i
syms x
f=sqrt(x-1)
g=x-1
fplot(f,'color','y','linewidth',2)
hold on
fplot(g,'color','k','linewidth',2)
solve(f==g,x)
area=int(f-g,x,-1,2)
x=1:.01:2
f1=sqrt(x-1)
g1=x-1
x1=[x,flip(x)]
y1=[f1,flip(g1)]
fill(x1,y1,'r')
legend('f','g')







