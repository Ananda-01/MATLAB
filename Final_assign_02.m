% 1 i
clc
clear all
close all
syms t
subplot(2,2,1)
x=sin(2*t)
fplot(x)
subplot(2,2,3)
y=sin(t+sin(2*t))
fplot(y)
xlabel('x')
ylabel('y')

%% 
% 1 iii
clc
clear all
close all
syms t
subplot(2,2,1)
x=(sin(2*t))/(4+t^2)
fplot(x)
subplot(2,2,3)
y=(cos(2*t))/(4+t^2)
fplot(y)
xlabel('x')
ylabel('y')

%%
% 1 b i
clc
clear all
close all
syms t
subplot(2,2,1)
x=cos(t)
fplot(x)
subplot(2,2,2)
y=sin(t)
fplot(y)
subplot(2,2,3)
z=cos(2*t)
fplot(z)

%%
% 1 c i
clc
clear all
close all
syms x y
f(x,y)=sqrt(x^2+y^2)
subplot(2,2,1)
fsurf(f,'linewidth',5,'edgecolor','y')
subplot(2,2,2)
fmesh(f,'linewidth',5,'edgecolor','g')
subplot(2,2,3)
fcontour(f,'linewidth',4)

%% 1 c ii
clc
clear all
close all
syms x y
f(x,y)=x*y*exp(-x^2-y^2)
subplot(2,2,1)
fsurf(f,'linewidth',5,'edgecolor','y')
subplot(2,2,2)
fmesh(f,'linewidth',5,'edgecolor','b')
subplot(2,2,3)
fcontour(f,'linewidth',4)

%%
% 1 c iv
clc
clear all
close all
syms u v
x=u*cos(v)
y=u*sin(v)
z=u^2
subplot(3,2,1)
fsurf(x,y,z,'linewidth',4,'edgecolor','g')
subplot(3,2,2)
fmesh(x,y,z,'linewidth',4,'edgecolor','y')
subplot(3,2,3)
fcontour(x,'linewidth',5)
subplot(3,2,4)
fcontour(y,'linewidth',5)
subplot(3,2,5)
fcontour(z,'linewidth',5)

%%
% 2 a i
clc
clear all
close all
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
% 3 i
clc
clear all
close all
syms x ln
f(x)=log(1+x^2);
mac=taylor(f,x,'ExpansionPoint',3,'order',9)
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
clc
clear all
close all
syms x
f=atan(x^3)
mac=taylor(f,x,'Expansionpoint',3,'Order',50)
t4=taylor(f,x,'Order',4)
t8=taylor(f,x,'Order',8)
t24=taylor(f,x,'Order',24)
t90=taylor(f,x,'Order',100)
fplot(f,'color','r')
hold on
fplot(t4,'color','g')
fplot(t24,'color','y')
legend('f','t4','t24')

%%
% practice 2
clc
clear all
close all
syms x y
f=3*x-x^3-2*y^2+y^4;
g=gradient(f)
h=hessian(f)
d=det(h)
fxx=h(1,1)
cp=solve(g==[0;0],'real',true)
M=[cp.x cp.y]
m=size(M,1)
for i=1:m
    xp=M(i,1)
    yp=M(i,2)
    Fxx=subs(fxx,[x,y],[xp,yp])
    Fxy=subs(f,[x,y],[xp,yp])
    D=subs(d,[x,y],[xp,yp])
    if(D>0&&Fxx<0)
        a=('relativeminimum');
    elseif(D>0&&Fxx>0)
        a=('relativemaximum');
    elseif(D<0)
        a=('saddlepoint');
    else
        a=('noconclusion');
    end
    r=[xp yp D Fxx a];
    disp(r)
end
[X,Y]=meshgrid(-5:.75:5,-5:.75:5)
F=3.*X-X.^3-2.*Y.^2+Y.^4
contour(X,Y,F)
hold on
plot(cp.x,cp.y,'o','Markerfacecolor','r')

%%
% practice 2 iii
clc
clear all
close all
syms x y
f=3*x^2-2*x*y+y^2-8*y;
g=gradient(f)
h=hessian(f)
fxx=h(1,1)
d=det(h)
cp=solve(g==[0;0],'real',true)
M=[cp.x cp.y]
m=size(M,1)
for i=1:m
    xp=M(i,1)
    yp=M(i,2)
    Fxx=subs(fxx,[x,y],[xp,yp])
    Fxy=subs(f,[x,y],[xp,yp])
    D=subs(d,[x,y],[xp,yp])
    if(D>0 && Fxx>0)
        a=('minimum');
    elseif(D>0 && Fxx<0)
        a=('maximum')
    elseif(D<0)
        a=('saddle point')
    else
        a=('no')
    end
    r=[xp yp Fxx D a];
    disp(r)
end
[X,Y]=meshgrid(-8:.25:8,-8:.25:8)
F=3.*X.^2-2.*X.*Y+Y.^2-8.*Y
contour(X,Y,F)
hold on
plot(cp.x,cp.y,'o','Markerfacecolor','r')
    

    








