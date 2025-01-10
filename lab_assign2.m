% 1 ii
clc
clear all
close all
syms y(t)
subplot(2,2,1)
x=t+sin(t);
fplot(x)
subplot(2,2,2)
y=t^2+cos(3*t)
fplot(y)

%%
% 1 a iii
clc
clear all
close all
syms y(t)
subplot(2,2,1)
x=(sin(2*t))/(4+t^2);
fplot(x)
subplot(2,2,2)
y=(cos(2*t))/(4+t^2)
fplot(y)

%%
% 1 b ii
clc
clear all 
close all
syms y(t)
x=t;
y=1/(1+t^2);
z=t^2;
fplot3(x,y,z,[-10 10])

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
fsurf(x,y,z)
subplot(2,2,2)
fmesh(x,y,z)
subplot(2,2,3)
fcontour(y)
subplot(2,2,4)
fcontour(z)

%%
% 2 a
clc
clear all
close all
syms x y
f=3*x-x^3-2*y^2+y^4;
g=gradient(f);
h=hessian(f);
d=det(h);
fxx=h(1,1);
cp=solve(g==[0;0],'real',true);
M=[cp.x cp.y];
m=size(M,1);
disp('x y fxx d comment')
for i=1:m
    xp=M(i,1);
    yp=M(i,2);
    Fxy=subs(f,[x,y],[xp,yp]);
    Fxx=subs(fxx,[x,y],[xp,yp]);
    D=subs(d,[x,y],[xp,yp])
    if(D>0&&Fxx<0)
        a=('relativeminimum');
    elseif(D>0&&Fxx>0)
        a=('relativemaximum');
    elseif(D<0)
        a=('saddlePoint');
    else
        a=('noconclusion');
    end
        r=[xp yp Fxx D a];
        disp(r)
end
[X,Y]=meshgrid(-10:.75:10,-10:.75:10);
F=3.*X - X.^3 - 2.*Y.^2 +Y.^4
contour(X,Y,F)
hold on
plot(cp.x,cp.y,'o','Markerfacecolor','k')

%%
% 3
clc
clear all
close all
syms x ln
f(x)=log(1+x^2)
mac=taylor(f,x,'Expansionpoint',0)
t4=taylor(f,x,'order',4)
t8=taylor(f,x,'order',8)
t12=taylor(f,x,'order',12)
fplot(f(x),'color','y')
hold on
fplot(t4,'color','g')
fplot(t8,'color','k')
fplot(t12,'color','b')

        





