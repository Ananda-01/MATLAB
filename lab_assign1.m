% 1 iii
clc
clear all
close all
syms x
f=(exp(x^3)-1)/(1-cos(sqrt(x-sin(x))))
fplot(f,'color','y','linewidth',3)
RHL=limit(f,x,0,'left')
LHL=limit(f,x,0,'right')
if(RHL==LHL)
    disp('Limit exists')
else
    disp('Limit does not exists')
end
axis([-12 12 -12 12])
xlabel('x')
ylabel('y')
title('finding limit existing')

%%
% 1 b iii
clc
clear all 
close all
syms x y
f=(exp(-1/(x^2+y^2)))*(sin(x)^2/x^2)*((1+1/y^2)^(x+4*y^2))
limit(limit(f,x,1/sqrt(y)),y,inf)

%% 
% 2 a
clc
clear all
close all
syms y(x) 
f(x)=exp(x^3)-x^3
f1=diff(f,1)
f2=diff(f,2)
fplot(f(x),'color','k')
hold on
fplot(f1,'color','r')
fplot(f2,'color','b')

%%
% 2 b
clc
clear all
close all
syms y(x)
f(x)=x^3+x-4;
a=1;
b=2;
f1=diff(f,1)
c=solve((f(b)-f(a))/(b-a)==f1,x)
t(x)=f(c) + f1(c).*(x-c)
s(x)=f(a) + ((x-a).*(f(a)-f(b)))/(a-b)
fplot(f(x),'color','k')
hold on
fplot(t(x),'color','b')
fplot(s(x),'color','r')
plot(c,f(c),'*g')
xlabel('x')
ylabel('y')
legend('f(x)','s(x)','t(x)')

%%
% 3
clc
clear all
close all
syms x
f=sqrt(x-1);
g=x-1;
solve(f==g,x)
fplot(f,'color','y')
hold on
fplot(g,'color','g')
area=int(f-g,x,1,2)
x=1:.01:2
f1=sqrt(x-1);
g1=x-1;
x1=[x,flip(x)]
y1=[f1,flip(g1)]
fill(x1,y1,'r')

%%
% 3 ii
clc
clear all
close all
syms x
f=cos(x);
g=1-cos(x);
solve(f==g,x)
fplot(f,'color','y')
hold on
fplot(g,'color','b')
area=int(f-g,x,-pi/3,pi)+int(g-f,x,0,pi/3)
x=-pi/3:.01:pi/3
f1=cos(x);
g1=1-cos(x);
x1=[x,flip(x)]
y1=[f1,flip(g1)]
fill(x1,y1,'r')



