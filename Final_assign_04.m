% 1
% Bisection method
clc
clear all
close all
syms x
f(x)=cos(x)-x*exp(x);
% find an interval that contain root
X=[0 1 2 3 4 5];
Y=sign(f(X));[X;Y];
fid=fopen('F_bisection.txt','w');
fprintf(fid,'%3s  %-8.6s  %-8.6s %-8.6s %-8.6s\n','n','a','b','root','error');
a=1;b=2;
n=1e+5;tol=1e-5;
for k=1:n
    p=(a+b)/2;
    error=abs(b-a)/abs(b);
    fprintf(fid,'%3d  %8.6f  %8.6f  %8.6f  %8.6f\n',k,a,b,p,error);
    if(error<tol)
        break
    end
    if sign(f(a))==sign(f(p))
        a=p;
    else
        b=p;
    end
end
fclose(fid)

%%
% Newton raphson method
clc
clear all
close all
syms x
f(x)=cos(x)-x*exp(x);
g(x)=diff(f,x);
% find an interval that contain root
X=[0 1 2 3 4 5];
Y=sign(f(X));[X;Y];
fid=fopen('F_Newton.txt','w');
fprintf(fid,'%3s %8.6s %8.6s\n','n','root','error');
tol=1e-4;n=1e+5;
p(1)=0.5; % initial value
for k=1:n
    p(k+1)=p(k)-f(p(k))/g(p(k));
    error=abs(p(k+1)-p(k))/abs(p(k+1));
    fprintf(fid,'%3d %7.5f %7.5f\n',k,p(k+1),error);
    if(error<tol)
        break
    end
end
fclose(fid);

%% 
% Fixed point iteration method
clc
clear all
close all
syms x
f(x)=cos(x)-x*exp(x);
g(x)=(cos(x)+x^2)/(exp(x)+x);
% find an interval that contain root
X=[0 1 2 3 4 5];
Y=sign(f(X));[X;Y];
fid=fopen('F_fixed.txt','w');
fprintf(fid,'%3s %7.4s %7.6s\n','n','root','error');
tol=1e-5;n=1e+5;
p(1)=0.5;
for k=1:n
    p(k+1)=g(p(k));
    error=abs(p(k+1)-p(k))/abs(p(k+1));
    fprintf(fid,'%3d %7.5f %7.5f\n',k,p(k+1),error);
    if(error<tol)
        break
    end
end
fclose(fid);

%% 
% 4 i
% Trapezoidal rule
clc
clear all
close all
syms x
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
% 4 ii
%simpson 1/3 rule
clc
clear all
close all
syms x
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
sum

%%
% 4 iii
% simpson 3/8 rule
clc
clear all
close all
syms x
f=@(x) 2/(x^2+4);
a=0;b=2;n=12;
h=(b-a)/n;
m=n/3;
sum=0;
for k=1:m
    A(k)=3*h/8*(f(a)+3*f(a+h)+3*f(a+2*h)+f(a+3*h));
    sum=sum+A(k);
    a=a+3*h;
end
sum

%%
% 4 iv
% Weddle rule
clc
clear all
close all
syms x
f=@(x) 2/(x^2+4);
a=0;b=2;n=12;
h=(b-a)/n;
m=n/6;
sum=0;
for k=1:m
    A(k)=3*h/10*(f(a)+5*f(a+2*h)+f(a+3*h)+6*f(a+4*h)+f(a+5*h)+5*f(a+6*h));
    sum=sum+A(k);
    a=a+6*h;
end
sum

%%
% 4 v
% Romberg integration
clc
clear all
close all
syms x
f=@(x) 2/(x^2+4);
a=0;b=2;n=6;
R=zeros(n);
% calculate first column of the table
h=b-a;
R(1,1)=h/2*(f(a)+f(b));
for i=2:n
    h=h/2;
    sum=0;
    for k=1:2^(i-2)
        x(k)=a+(a+(2*k-1)*h);
        sum=sum+f(x(k));
    end
    R(i,1)=1/2*(R(i-1,1)-2*h*sum)
end
% calculate others column of the table
for j=2:n
    for i=j:n
        R(i,j)=(R(i-1,1)*4^(j-1)-R(i-1,j-1))/(4^(j-1)-1)
    end
end

%%
clc
clear all
close all
syms x
x=[0.0 0.5 1.0 1.5 2.0];
f=@(x) 0.2.*x.*exp(0.1.*x.^2);
y=f(x);
n=length(x)
L=zeros(1,n)















