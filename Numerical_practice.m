% ques 4
clc
clear all
close all
% trapezoid rule
f=@(x) 2/(x^2+4);
a=0;b=2;n=12;
h=(b-a)/n;
sum=0;
for k=1:n
    A(k)=h/2*(f(a)+f(a+h));
    sum=sum+A(k);
    a=a+h;
end
fprintf('value of integration %0.8f',sum)

%%
clc
clear all
close all
% simpson's 1/3 rule
f=@(x) 2/(x^2+4);
a=0;b=2;n=12;
h=(b-a)/n;
m=n/2;
sum=0;
for k=1:m
    A(k)=h/3*(f(a)+4*f(a+h)+f(a+2*h));
    sum=sum+A(k);
    a=a+2*h;
end
fprintf('value %0.8f',sum)

%%
clc
clear all
close all
% simpson's 3/8 rule
f=@(x) 2/(x^2+4);
a=0;b=2;n=12;
h=(b-a)/12;
m=n/3;
sum=0;
for k=1:m
    A(k)=(3*h/8)*(f(a)+3*f(a+h)+3*f(a+2*h)+f(a+3*h));
    sum=sum+A(k);
    a=a+3*h;
end
fprintf('value %0.8f',sum)
%%
clc
clear all
close all
% weddles rule
f=@(x) 2/(x^2+4);
a=0;b=2;n=12;
h=(b-a)/12;
m=n/6;
sum=0;
for k=1:m
    A(k)=(3*h/10)*(f(a)+5*f(a+h)+f(a+2*h)+6*f(a+3*h)+f(a+4*h)+5*f(a+5*h));
    sum=sum+A(k);
    a=a+6*h;
end
fprintf('value %0.8f',sum)

%%
clc
clear all
close all
% Romberg integration
f=@(x) 2/(x^2+4);
a=0;b=2;n=6;
R=zeros(n);
% calculate the first column of the table
h=b-a;
R(1,1)=h/2*(f(a)+f(b));
for i=2:n
    h=h/2;
    sum=0;
    for k=1:2^(i-2)
        x(k)=a+(a+(2*k-1)*h);
        sum=sum+f(x(k));
    end
    R(i,1)=1/2*(R(i-1,1)+(2*h*sum))
end
% calculate the another column of the table
for j=2:n
    for i=j:n
        R(i,j)=(R(i,j-1)*(4^(j-1))-R(i-1,j-1))/(4^(j-1)-1);
    end
end
R
%% 
% Bisection method
syms x
f(x)=2*cos(x)+exp(x)+2^(-x)-6;
% find an interval that contain root
Y=sign(f(X));[X;Y];
a=1;b=2;
n=1e5;tol=1e-5;
% open text file
fid=fopen('Bisection_2.txt','w');
fprintf(fid,'%0.3s %-8.6s %-8.6s %-8.6s %-8.6s\n','n','a','b','root','error')
for k=1:n
    p=(a+b)/2;
    error=abs(b-a)/abs(b);
    fprintf(fid,'%0.1d %8.6f %8.6f %8.6f %8.6f\n',k,a,b,p,error);
    if(error<tol)
        break
    end
    if sign(f(a))==sign(f(p))
        a=p;
    else
        b=p;
    end
end

%%
% fixed point iteration
syms x
f(x)=2*cos(x)+exp(x)+2^(-x)-6;
g(x)=log(6-2*cos(x)-2^(-x));
% find an interval that contain a root
X=[0 1 2 3 4 5];
Y=sign(f(X));[X;Y];
p(1)=0.5;
n=1e5;tol=1e-5;
% open text file
fid=fopen('fixed point_1.txt','w');
fprintf(fid,'%0.3s %-8.6s %-8.6s\n','n','root','error');
for k=1:n
    p(k+1)=g(p(k));
    error=abs(p(k+1)-p(k))/abs(p(k+1));
    fprintf(fid,'%0.1d %-8.6f %-8.6f\n',k,p(k+1),error);
    if(error<tol)
        break
    end
end

%%
% newton's raphson method
syms x
f(x)=2*cos(x)+exp(x)+2^(-x)-6;
g(x)=diff(f,x);
% find an interval that contain root
X=[0 1 2 3 4 5];
Y=sign(f(X));[X;Y];
% open a text file
fid=fopen('Newton method_1.txt','w');
fprintf(fid,'%0.3s  %.6s  %.6s\n','n','root','error');
p(1)=0.5;
for k=1:n
    p(k+1)=p(k)-f(p(k))/g(p(k));
    error=abs(p(k+1)-p(k))/abs(p(k+1));
    fprintf(fid,'%0.1d  %0.6f  %0.6f\n',k,p(k+1),error);
    if(error<tol)
        break
    end
end

%%
% newtons interpolation
clc
clear all
close all
function [Y]=D(X)
x=[0.0 1.20 1.4 1.6 1.8 2.0];
y=[0.242 0.1942 0.1497 0.1109 0.079 0.054];
n=length(x);
F=zeros(n);
F(:,1)=y';
for j=2:n
    for i=j:n
        F(i,j)=(F(i,j-1)-F(i-1,j-1))/(x(i)-x(i-j+1));
    end
end
sum=0;
for j=2:n
    prod=1;
    for i=1:j-1
        prod=prod*(X-x(j));
    end
    sum=sum+prod*F(j,j);
end
Y=sum+F(1,1);
end
%%
% simpson's 3/8 rule
clc
clear all
close all
f=@(x) 2/(x^2+4)
a=0;b=2;n=12;
h=(b-a)/n;
m=n/3;
sum=0;
for k=1:m
    A(k)=(3*h/8)*(f(a)+3*f(a+h)+3*f(a+2*h)+f(a+3*h));
    sum=sum+A(k);
    a=a+3*h;
end
fprintf('value of %0.8f',sum)

%% 
% Romberg intehration
clc
clear all
close all
f=@(x) 2/(x^2+4)
a=0;b=2;h=b-a;
n=6;
R=zeros(n);
% calculate the first column of the table
R(1,1)=h/2*(f(a)+f(b));
for i=2:n
    sum=0;
    h=h/2;
    for k=1:2^(i-2)
        x(k)=(a+(2*k-1)*h);
        sum=sum+f(x(k));
    end
    R(i,1)=1/2*(R(i-1,1)+2*h*sum);
end
% calculate the others column
for j=2:n
    for i=j:n
        R(i,j)=(R(i,j-1)*4^(j-1)-R(i-1,j-1))/(4^(j-1)-1);
    end
end
R
%% 
clc
clear all
close all
% Romberg integration
f=@(x) 2/(x^2+4);
a=0;b=2;h=b-a;n=6;
R=zeros(n);
R(1,1)=h/2*(f(a)+f(b));
% calculate the first column of the table
for i=2:n
    h=h/2;
    sum=0;
    for k=1:2^(i-2)
        x(k)=(a+(2*k-1)*h);
        sum=sum+f(x(k));
    end
    R(i,1)=1/2*(R(i-1,1)+2*h*sum)
end
% calculate the other's column
for j=2:n
    for i=j:n
        R(i,j)=(R(i,j-1)*4^(j-1)-R(i-1,j-1))/(4^(j-1)-1);
    end
end
R
%%
% newton's interpolation
function [Y]=F(X)
x=[0.0 1.2 1.4 1.6 1.8 2.0];
y=[0.242 0.1942 0.1497 0.1109 0.079 0.054]
n=length(x);
F=zeros(n);
F(:,1)=y';
for j=2:n
    for i=j:n
        F(i,j)=(F(i,j-1)-F(i-1,j-1))/(x(i)-x(i-j+1))
    end
end
sum=0;
for j=2:n
    prod=1;
    for i=1:j-1
        prod=prod*(X-x(j));
    end
    sum=sum+prod*(F(j,j))
end
Y=sum+F(1,1)
end

%% 
% lagrange interpolation
f=@(x) 0.2.*x.*exp(0.1.*x^.2)
x=[0.0 0.5 1 1.5 2];
n=length(x);
L=zeros(1,n);
y=f(x);
for i=1:n
    L(i)=1
    for j=1:n
        if(i==j)
            continue
        end
        L(i)=L(i)*(X-x(i))/(x(i)-x(j))
    end
end
sum=0;
for i=1:n
    sum=sum+L(i)*y(i)
end
%%
% bissection method
clc
clear all
close all
syms x
f(x)=cos(x)-x*exp(x);
% find an interval that contain a root
X=[0 1 2 3 4 5];
Y=sign(f(X));[X;Y];
a=1;b=2;
n=1e5;tol=1e-5;
% open text file
fid=fopen('Bisection3.txt','w');
fprintf(fid,'%0.3s %8.6s %8.6s %8.6s %8.6s\n','n','a','b','root','error');
for k=1:n
    p=(a+b)/2;
    error=abs(b-a)/abs(b);
    fprintf(fid,'%0.1d %8.6f %8.6f %8.6f %8.6f\n',k,a,b,p,error);
    if(error<tol)
        break
    end
        if sign(f(a))==sign(f(p))
            a=p;
        else
            b=p;
        end
end

%%
% newton's raphson method
clc
clear all
close all
syms x
f(x)=cos(x)-x*exp(x);
g(x)=diff(f,x);
% find an interval that contain a root
X=[0 1 2 3 4 5];
Y=sign(f(X));[X;Y];
p(1)=0.15;
n=1e5;tol=1e-5;
% open a text file
fid=fopen('Newtons_3.txt','w');
fprintf(fid,'%0.3s %8.6s %8.6s\n','n','root','error');
for k=1:n
    p(k+1)=p(k)-f(p(k))/g(p(k));
    error=abs(p(k+1)-p(k))/abs(p(k+1));
    fprintf(fid,'%0.1d %8.6f %8.6f\n',k,p(k+1),error);
    if(error<tol)
        break
    end
end


        

    


        



    
    
    
    
    
    
    
    
    
    
    
    
    
    
