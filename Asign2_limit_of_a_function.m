%1 a i
syms t x y
subplot(2,2,1)
x=sin(2*t)
fplot(x,[-10,10])
subplot(2,2,2)
y=sin(t+sin(2*t))
fplot(y,[-10,10])
xlabel('x')
ylabel('y')

%%
% 1 a ii
syms t x y 
subplot(2,2,1)
x=t+sin(4*t);
fplot(x,[-10,10])
subplot(2,2,2)
y=t^2+cos(3*t);
fplot(y,[-10,10]);
xlabel('x')
ylabel('y')

%%
% 1 a iii
syms t x y
subplot(2,2,1)
x=(sin(2*t))/(4+t^2);
fplot(x,[-10,10])
subplot(2,2,2)
y=(cos(2*t))/(4+t^2);
fplot(x,y,[-10,10]);
xlabel('x')
ylabel('y')

%%
% 1 b i
syms t x y z
subplot(2,2,1)
x=cos(t);
fplot(x,[-10,10])
subplot(2,2,2)
y=sin(t);
fplot(y,[-10,10])
subplot(2,2,3)
z=cos(2*t);
fplot(z,[-10,10])


%%
% 1 c i
clc
clear all
close all
syms x y 
f = sin(sqrt(x^2+y^2));
subplot(2,2,1)
fsurf(f,'linewidth',4,'Edgecolor','g')
subplot(2,2,2)
fmesh(f,'linewidth',4,'Edgecolor','k')
subplot(2,2,3)
fcontour(f,'linewidth',4)

%%
%1 c ii
clc
clear all
close all
syms x y
f=x*y*exp(-(x^2+y^2));
subplot(2,2,1)
fsurf(f,'linewidth',4,'Edgecolor','r')
subplot(2,2,2)
fmesh(f,'linewidth',5,'Edgecolor','k')
subplot(2,2,3)
fcontour(f,'linewidth',5)

%%
% 1 c iv
clc
clear all
close all
syms u v
x=u*cos(v);
y=u*sin(v);
z=u^2;
subplot(2,2,1)
fsurf(x,y,z,'linewidth',6,'Edgecolor','b')
subplot(2,2,2)
fmesh(x,y,z,'linewidth',6,'Edgecolor','r')
subplot(2,2,3)
fcontour(z,'linewidth',6)
subplot(2,2,4)
fcontour(y,'linewidth',6)

%%
clc
clear all 
close all
% 2 a i
syms x y
f=3*x-x^3-2*y^2+y^4;
g=gradient(f);
h=hessian(f);
fxx=h(1,1);
cp=solve(g==[0;0],'real',true);
d=det(h);
M=[cp.x cp.y];
m=size(M,1);
disp('x y fxx d conclusion')
for i=1:m;
    xp=M(i,1);
    yp=M(i,2);
    Fxy=subs(f,[x,y],[xp,yp]);
    Fxx=subs(fxx,[x,y],[xp,yp]);
    D=subs(d,[x,y],[xp,yp]);
    if(D>0&&Fxx<0)
        a=('relativeminimum');
    elseif(D>0&&Fxx>0)
        a=('relativemaximum');
    elseif(D<0)
        a=('saddlepoint');
    else
        a=('noconclusion');
    end
    r=[xp yp Fxx D a];
    disp(r)
end
[X,Y]=meshgrid(-6:.1:6,-6:.1:6);
F=3.*X-X.^3-2.*Y.^2+Y.^4;
contour(X,Y,F)
hold on
plot(cp.x,cp.y,'o','Markerfacecolor','r')
       
%%
% 2 a ii
clc
clear all
close all
syms x y
f=4+x^3+y^3-3*x*y;
g=gradient(f);
h=hessian(f);
cp=solve(g==[0;0],'real',true);
d=det(h);
fxx=h(1,1);
M=[cp.x cp.y];
m=size(M,1);
disp('x y fxx fxy d conclusion')
for i=1:m;
    xp=M(i,1);
    yp=M(i,2);
    Fxy=subs(f,[x,y],[xp,yp]);
    D=subs(d,[x,y],[xp,yp]);
    Fxx=subs(fxx,[x,y],[xp,yp]);
    if(D>0&&Fxx<0)
        a=('relativeminimum');
    elseif(D>0&&Fxx>0)
        a=('relativemaximium');
    elseif(D<0)
        a=('saddlepoint');
    else
        a=('noconclusion');
    end
    r=[xp yp Fxx Fxy D a];
    disp(r)
end
[X,Y]=meshgrid(-5:.75:5,-5:.75:5);
F=4+X.^3+Y.^3-3.*X.*Y;
contour(X,Y,F)
hold on
plot(cp.x,cp.y,'o','Markerfacecolor','r')

%%
% 2 a iii
clc
clear all
close all
syms x y
f=3*x^2-2*x*y+y^2-8*y;
g=gradient(f);
h=hessian(f);
fxx=h(1,1);
d=det(h);
cp=solve(g==[0;0],'real',true);
M=[cp.x cp.y];
m=size(M,1);
disp('x y fxy fxx d conclusion')
for i=1:m
    xp=M(i,1);
    yp=M(i,2);
    Fxy=subs(f,[x,y],[xp,yp]);
    D=subs(d,[x,y],[xp,yp]);
    Fxx=subs(fxx,[x,y],[xp,yp]);
    if(D>0&&Fxx<0)
        a=('relativeminimum');
    elseif(D>0&&Fxx>0)
        a=('relativemaximum');
    elseif(D<0)
        a=('saddlepoint');
    else
        a=('noconclusion');
    end
        r=[xp yp Fxy Fxx D a];
        disp(r)
end

[X,Y]=meshgrid(-8:.85:8,-8:.85:8);
F=3.*X^2-2*X*Y+Y^2-8.*Y;
contour(X,Y,F)
hold on
plot(cp.x,cp.y,'o','Markerfacecolor','r')



%%
% 3 i
clc
clear all 
close all
syms x
f(x)=atan(x^3);
mac=taylor(f,x,'ExpansionPoint',0,'order',20)
t4=taylor(f,x,'Order',4);
t10=taylor(f,x,'Order',10);
t16=taylor(f,x,'Order',16);
fplot(f,'color','k','linewidth',2)
hold on
xlabel('x')
ylabel('y')
fplot(t4,'linewidth',1)
fplot(t10,'linewidth',1)
fplot(t16,'linewidth',1)
legend('f','t4','t10','t16')

%%
% 3 ii
clc 
clear all
close all
syms x ln
f(x)=log(1+x^2);
mac=taylor(f,x,'ExpansionPoint',0,'order',9)
t4=taylor(f,x,'Order',4);
t10=taylor(f,x,'Order',10);
t16=taylor(f,x,'Order',16);
fplot(f,'color','k','linewidth',2)
hold on
xlabel('x')
ylabel('y')
fplot(t4,'linewidth',1)
fplot(t10,'linewidth',1)
fplot(t16,'linewidth',1)
legend('f','t4','t10','t16')






























