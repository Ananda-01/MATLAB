% 2 i
clc
clear all
close all
syms x y
f=3*x-x^3-2*y^2+y^4
g=gradient(f)
h=hessian(f)
cp=solve(g==[0;0],'real',true)
fxx=h(1,1)
d=det(h)
M=[cp.x cp.y]
m=size(M,1)
disp('x y fxx d conclusion')
for i=1:m
    xp=M(i,1)
    yp=M(i,2)
    Fxy=subs(f,[x,y],[xp,yp])
    Fxx=subs(fxx,[x,y],[xp,yp])
    D=subs(d,[x,y],[xp,yp])
    if(D>0&&Fxx<0)
        a=('relativeminimum')
    elseif(D>0&&Fxx>0)
        a=('relativemaximum')
    elseif(D<0)
        a=('saddlepoint')
    else
        a=('noconclusion')
    end
    r=[xp yp Fxx D a]
    disp(r)
end

[X,Y]=meshgrid(-10:.85:10,-10:.85:10)
F=3.*X-X.^3-2.*Y.^2+Y.^4
contour(X,Y,F)
hold on
plot(cp.x,cp.y,'o','Markerfacecolor','r','Markersize',6)

%%
% 2 a iii
clc
clear all
close all
syms x y
f=3*x^2-2*x*y+y^2-8*y
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
    Fxy=subs(f,[x,y],[xp,yp])
    Fxx=subs(fxx,[x,y],[xp,yp])
    D=subs(d,[x,y],[xp,yp])
    if(D>0&&Fxx<0)
        a=('relativeminimum')
    elseif(D>0&&Fxx<0)
        a=('relativemaximum')
    elseif(D<0)
        a=('saddlepoint')
    else
        a=('noconclusion')
    end
        r=[xp yp Fxx D a]
        disp(r)
end

[X,Y]=meshgrid(-10:.75:10)
F=3.*X.^2 - 2.*X.*Y + Y.^2 -8.*Y
contour(X,Y,F)
hold on
plot(cp.x,cp.y,'o','Markerfacecolor','g','Markersize',6)


%%
% 3 
clc
clear all
close all
syms a x
f=atan(x^3)
mac=taylor(f,x,'ExpansionPoint',0)
t4=taylor(f,x,'order',4)
t10=taylor(f,x,'order',10)
t16=taylor(f,x,'order',16)
fplot(f,'color','g')
hold on
fplot(t4,'color','y')
fplot(t10,'color','r')
fplot(t16,'color','b')








        
        
        





