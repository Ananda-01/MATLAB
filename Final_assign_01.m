% 1 a i
clc
clear all
close all
syms x
f(x)=1/(1+exp(1/x))
fplot(f)
RHL=limit(f,x,0,'right')
LHL=limit(f,x,0,'left')
if(LHL==RHL)
    disp('limit exists')
else
    disp('limit doesnot exists')
end

%%
% 1 a iii
clc
clear all
close all
syms x
f(x)=(exp(x^3)-1)/(1-cos(sqrt(x-sin(x))));
fplot(f)
LHL=limit(f,x,0,'right')
RHL=limit(f,x,0,'left')
if(LHL==RHL)
    disp('limit exists')
else
    disp('limit does not exists')
end

%%
% 2 i
clc
clear all
close all
syms x
f(x)=sqrt(9*x^2+x)-3*x
limit(f,x,inf)

%%
% 1 iii
clc
clear all
close all
syms x y
f(x)=(exp(-1/(x^2+y^2)))*((sin(x)^2)/x^2)*((1+1/y^2)^(x+4*y^2))
limit(limit(f,x,1/sqrt(y)),y,inf)

%%
% 2 a i
clc
clear all
close all
syms x
f(x)=2*x-5*x^(3/4)
f1=diff(f,1)
f2=diff(f,2)
fplot(f,'color','g')
hold on
fplot(f1,'color','k')
fplot(f2,'color','r')
xlabel('x')
ylabel('y')

%%
% 2 a ii
clc
clear all
close all
syms x
f(x)=exp(x)-x^3
f1=diff(f,1)
f2=diff(f,2)
fplot(f,'color','r')
hold on
fplot(f1,'color','k')
fplot(f2,'color','g')

%%
% 2 b i
clc
clear all
close all
syms x
f(x)=sqrt(x)
a=0;
b=4;
f1=diff(f,1)
f2=diff(f,2)
c=solve((f(b)-f(a))/(b-a)==f1,x)
t(x)=f(c)+f1(c).*(x-c)
s(x)=((x-a)*(f(a)-f(b)))/(a-b)+f(a)
fplot(f,'linewidth',2,'color','k')
hold on
fplot(s(x),'linewidth',2,'color','r')
fplot(t(x),'linewidth',2,'color','g');
plot(c,f(c),'o','Markerfacecolor','y')

%%
% 2 b ii
clc
clear all
close all
syms x
f(x)=x^3+x-4
a=1;
b=2;
f1=diff(f,1)
f2=diff(f,2)
c=solve(((f(b)-f(a))/(b-a))==f1,x)
s(x)=((x-a)*(f(a)-f(b)))/(a-b)+f(a)
t(x)=f(c)-f1(c).*(x-c)
fplot(f,'linewidth',2,'color','g')
hold on
fplot(s(x),'linewidth',2,'color','k')
fplot(t(x),'linewidth',2,'color','r')
plot(c,f(c),'o','Markerfacecolor','b')

%%
% 2 c i
clc
clear all
close all
syms x
f(x)=36*x+3*x^2-2*x^3
f1=diff(f,1)
f2=diff(f,2)
s1=solve(f1==0,x)
s2=solve(f2==0,x)
fplot(f,'linewidth',2,'color','r')
hold on
fplot(f1,'linewidth',2,'color','k')
fplot(f2,'linewidth',2,'color','g')
plot(s1,f(s1),'o','Markerfacecolor','b')
plot(s2,f(s2),'o','Markerfacecolor','y')
axis([-10 10 -200 200])

%%
% 2 d i
clc
clear all
close all
syms x y
f(x,y)=(x^2-2*x)*exp(-x^2-y^2-x*y)
fx=diff(f,x)
fy=diff(f,y)

%%
% 2 d ii
clc
clear all
close all
syms x y z
f(x,y,z)=sin(x^2*y)*exp(-x^2*y-z^2)
diff(diff(diff(f,x,2),y),z)

%% 
% 3 i
clc
clear all
close all
syms x
f(x)=sqrt(x-1)
g(x)=x-1
fplot(f,'color','y','linewidth',2)
hold on
fplot(g,'color','k','linewidth',2)
solve(f==g,x)
area=int(f-g,x,-1,2)
x=1:.01:2
f1=sqrt(x-1)
g1=x-1
x1=[flip(x),x]
y1=[flip(f1),g1]
fill(x1,y1,'r')
legend('f','g')

%%
% 3
clc
clear all
close all
syms y(x)
f(x)=sqrt(x-1)
g(x)=x-1
fplot(f,'color','g')
hold on
fplot(g,'color','y')
solve(f==g,x)
area=int(f-g,x,-1,2)
x=1:.01:2
f1=sqrt(x-1)
g1=x-1
x1=[flip(x),x]
y1=[flip(f1),g1]
hold on
fill(x1,y1,'r')
legend('f','g')

%%
clc
clear all
close all
syms y(x)
f=cos(x)
g=1-cos(x)
fplot(f,'color','y')
hold on
fplot(g,'color','g')
solve(f==g,x)
area=








