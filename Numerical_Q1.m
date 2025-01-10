clc
clear all
close all
% Bisection Method
syms x;
f(x)=cos(x)-x*exp(x);
a=1;b=2;
tol=1e-5;
n=1000;
for i=1:n
    c=(a+b)/2;
    fa=f(a);
    fb=f(b);
    fc=f(c);
    if(abs(fc)<tol)
        break;
    end
    if(fa*fc<0)
        b=c;
    else
        a=c;
    end
end
disp(c)
ezplot(f)
hold on
plot(c,fc,'*')




%%
clc
clear all
close all
% fixed point iteration
syms x
g(x)=cos(x)/exp(x)
x0=0;
n=10;
tol=1e-5;
for i=1:n;
    x1=g(x0);
    if(abs(x1-x0)<tol)
        break;
    end
    x0=x1;
end
disp(double(x1))

%%
% newtons method
clc
clear all
close all
syms x
f(x)=(cos(x)-x*exp(x));
g(x)=diff(f,x);
p0=1;
i=1;
tol=1e-5;
while(i<100)
    p=p0-f(p0)/g(p0);
    if(abs(p-p0)<0)
        p=p0;
    end
    i=i+1;
end
disp(double(p))

        
%%
clc
clear all
close all
% ques 2
% newton's interpolation formula
function [Y]=G(X)
x=[0.0 1.2 1.4 1.6 1.8 2.0];
y=[.242 .1942 .1497 .1109 .079 .054];
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
        prod=prod*(X-x(i));
    end
    sum=sum+prod*F(j,j);
end
Y=F(1,1)+sum;
end





%%
clc
clear all
close all
% ques 3
% Lagrange's interpolation formula
function [Y]=F(X)
x=[0.0 0.5 1.0 1.5 2.0];
f=@(x) 0.2.*x.*exp(0.1.*x.^2);
y=f(x);
n=length(x);
L=zeros(1,n);
for i=1:n
    L(i)=1;
    for j=1:n
        if(i==j)
            continue
        end
        L(i)=L(i)*(X-x(j))/(x(i)-x(j));
    end
end
sum=0;
for i=1:n
    sum=sum+L(i)*y(i);
end
Y=sum;
end

%%
clc
clear all
close all
% ques 4
% Trapezoidal rule
f=@(x) 2/(x^2+4);
a=0;b=2;n=12;
h=(b-a)/n;
sum=0;
for k=1:n
    A(k)=(h/2)*(f(a)+f(a+h));
    sum=sum+A(k);
    a=a+h;
end
fprintf('value of integration %10.8f',sum)

%%
clc
clear all
close all
% ques 4
% Simpson's 1/3 rule
f=@(x) 2/(x^2+4)
a=0;b=2;n=12;
h=(b-a)/n;
sum=0;
m=n/2;
for k=1:m
    A(k)=(h/3)*(f(a)+4*f(a+h)+f(a+2*h));
    sum=sum+A(k);
    a=a+2*h;
end
fprintf('value of integration %.8f',sum)

%%
clc
clear all
close all
% ques 3
% Simpson's 3/8 rule
f=@(x) 2/(x^2+4)
a=0;b=2;n=12;
h=(b-a)/n;
sum=0;
m=n/3;
for k=1:m
    A(k)=(3*h/8)*(f(a)+3*f(a+h)+3*f(a+2*h)+f(a+3*h));
    sum=sum+A(k);
    a=a+3*h;
end
fprintf('value of integration%.8f',sum)

%%
clc
clear all
close all
% ques 4
% Weddle's rule
f=@(x) 2/(x^2+4)
a=0;b=2;n=12;
h=(b-a)/n;
m=n/6;
sum=0;
for k=1:m
    A(k)=(3*h/10)*(f(a)+5*f(a+h)+f(a+2*h)+6*f(a+3*h)+f(a+4*h)+5*f(a+5*h));
    sum=sum+A(k);
    a=a+6*h;
end
fprintf('value of integration %0.8f',sum)

%%
clc
clear all
close all
% ques 4
% Romberg integration
f=@(x) 2/(x^2+4);
a=0;b=2;n=6;
R=zeros(n);
% calculate the first column of the R table
h=b-a;
R(1,1)=(h/2)*(f(a)+f(b));
for i=2:n
    sum=0;
    h=h/2;
    for k=1:2^(i-2)
        x(k)=a+(2*k-1)*h;
        sum=sum+f(x(k));
    end
    R(i,1)=1/2*(R(i-1,1)+2*h*sum)
end
% calculate the rest of the R table
for j=2:n
    for i=j:n
        R(i,j)=(R(i,j-1)*4^(j-1)-R(i-1,j-1))/(4^(j-1)-1);
    end
end
R
% array2table(R)
% fprintf('value of integration %10.8f\n',R(n,n))


%% 
clc
clear all
close all
% ques 2
% Bisection method
syms x;
f(x)=x^3+4*x^2-10;
% find an interval that contain root
X=[0 1 2 3 4 5];
Y=sign(f(X));[X;Y];
a=1;b=2;tol=1e-4;
n=1e5;
fid=fopen('Bisection.txt','w');
fprintf(fid,'%3s  %-8.6s  %-8.6s  %-8.6s  %-8.6s\n','n','a','b','root','error');
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
fclose(fid);

%%
% newtons raphson method
clc
clear all
close all
syms x
f(x)=(cos(x)-x*exp(x));
% find an interval that contain root
X=[0 1 2 3 4 5];
Y=sign(f(X));[X;Y];
g(x)=diff(f,x);
% open a text file
fid=fopen('Newton-Raphson.txt','w');
fprintf(fid,'%3s  %-8.6s  %-8.6s\n','n','root','error');
tol=1e-5;n=1e5;
p(1)=0.5;
for k=1:n
    p(k+1)=p(k)-f(p(k))/g(p(k));
    error=abs(p(k+1)-p(k))/abs(p(k+1));
    fprintf(fid,'%3d  %8.6f  %8.6f\n',k,p(k+1),error);
    if(error<tol)
        break
    end
end
fclose(fid);

%%
% ques 1
% fixed point iteration method
clc
clear all
close all
syms x
f(x)=cos(x)-x*exp(x);
% find an interval that contain root
X=[0 1 2 3 4 5];
Y=sign(f(X));[X;Y];
% Define iteration function g(x)
g(x)=(cos(x)+x^2)/(exp(x)+x);
% open a text file
fid=fopen('Fixed Point.txt','w');
fprintf(fid,'%3s  %-8.6s  %-8.6s\n','n','root','error');
tol=1e-5;n=1e5;
p(1)=0.5;
for k=1:n
    p(k+1)=g(p(k));
    error=abs(p(k+1)-p(k))/abs(p(k+1));
    fprintf(fid,'%3d  %8.6f  %8.6f\n',k,p(k+1),error);
    if error<tol
        break
    end
end
fclose(fid);






    







