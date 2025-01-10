syms x y
f=3*x-x^3-2*y^2+y^4;
g=gradient(f);
h=hessian(f);
fxx=h(1,1);
d=det(h);
cp=solve(g==[0;0],'Real',true);
M=[cp.x cp.y];
m=size(M,1);
disp('x   y   fxx d fxy conclution')
for i=1:m;
    xp=M(i,1);
    yp=M(i,2);
    Fxy=subs(f,[x y],[xp yp]);
    Fxx=subs(fxx,[x y],[xp yp]);
    D=subs(d,[x y],[xp yp]);
    if(D>0&&Fxx>0)
        a=('relativeminimum');
    elseif(D>0&&Fxx<0)
        a=('relativemaximum');
         elseif(D<0)
             a=('saddlepoint');
    else
    
        a=('noconclution');
    end
        r=[xp yp Fxx D Fxy a];
        disp(r)
end
close all
   [X Y]=meshgrid(-5:.1:5,-5:.1:5);
   F=3.*X-X.^3-2.*Y.^2+Y.^4;
   contour(X,Y,F)
   clabel(contour(X,Y,F),'Fontsize', 10)
   hold on
   plot(cp.x,cp.y,'o','Markerfacecolor','k')
   %%
   clc
   close all
   clear all
   syms x y
f=4+x^3+y^3-3*x*y;
g=gradient(f);
h=hessian(f);
fxx=h(1,1);
d=det(h);
cp=solve(g==[0;0],'Real',true);
M=[cp.x cp.y];
m=size(M,1);
disp('x   y   fxx d fxy conclution')
for i=1:m;
    xp=M(i,1);
    yp=M(i,2);
    Fxy=subs(f,[x y],[xp yp]);
    Fxx=subs(fxx,[x y],[xp yp]);
    D=subs(d,[x y],[xp yp]);
    if(D>0&&Fxx>0)
        a=('relativeminimum');
    elseif(D>0&&Fxx<0)
        a=('relativemaximum');
         elseif(D<0)
             a=('saddlepoint');
    else
    
        a=('noconclution');
    end
        r=[xp yp Fxx D Fxy a];
        disp(r)
end
close all
   [X Y]=meshgrid(-5:.1:5,-5:.1:5);
   F=4+X.^3+Y.^3-3.*X.*Y;
   contour(X,Y,F)
   clabel(contour(X,Y,F),'Fontsize', 10)
   hold on
   plot(cp.x,cp.y,'o','Markerfacecolor','k')
   
   
   

   
   
   
