clc
clear all
close all

%%
% Question 4(a)

syms y(t) s Y
y0=1; yp0=-1;
ode = diff(y,2)+4*diff(y)+4*y == 3*exp(-3*t);
% Applies the Laplace transform
lode=laplace(ode,t,s);
lode=subs(lode,{laplace(y(t),t,s),y(0),'D(y)(0)'},{Y,y0,yp0});

Y=solve(lode,Y);
y=ilaplace(Y,s,t);
disp('Solution of the IVP')
disp(simplify(y))

figure(1)
hold on
fplot(y,'Linewidth',2)
plot(0,1,'.r','MarkerSize',25)
grid on
axis([-5 5 -5 5])

%%
% Question 4(b)
syms y(t) s Y A
y0=0;yp0=A;y1=0;
ode=diff(y,2)+y == -t;
lode=laplace(ode,t,s);
lode=subs(lode,{laplace(y(t),t,s),y(0),'D(y)(0)'},{Y,y0,yp0});

Y=solve(lode,Y);
y=ilaplace(Y,s,t);
B=solve(subs(y,t,1)==y1,A); % evaluate the solution at t=1, y(1)=y1
y=subs(y,A,B); % Replaces A with its correct value

disp('Solution of BVP')
disp(simplify(y))

figure(2);
hold on
fplot(y,'Linewidth',2)
plot([0,1],[0,0],'.r','MarkerSize',25)
grid on;
axis([-5 5 -5 5])
hold off

%%
% Question 4(c)
clc
clear all
close all
syms y(t) s Y
y0=0;yp0=-2;
f(t)=2*heaviside(6-t)+t*heaviside(t-6)*heaviside(10-t)+4*heaviside(t-10);
ode=diff(y,2)+3*diff(y)+2*y == f(t);
lode=laplace(ode,t,s);
lode=subs(lode,{laplace(y(t),t,s),y(0),'D(y)(0)'},{Y,y0,yp0});

Y=solve(lode,Y);
y=ilaplace(Y,s,t);
disp('Solution of the IVP')
disp(simplify(y))

figure(3);
hold on
fplot(y,'Linewidth',2)
plot(0,0,'.r','MarkerSize',25)
grid on
axis([-5 5 -5 5])
hold off


%%
% Question 4(d)
clear all
syms y(t) s Y
y0=1;yp0=2;
ode=diff(y,2)+2*diff(y)+10*y == 1+5*dirac(t-5);
lode=laplace(ode,t,s);
lode=subs(lode,{laplace(y(t),t,s),y(0),'D(y)(0)'},{Y,y0,yp0});

Y=solve(lode,Y);
y=ilaplace(Y,s,t);
disp('Solution of the IVP')
disp(simplify(y))

figure(4);
hold on
fplot(y,'Linewidth',2)
plot(0,1,'.r','MarkerSize',25)
grid on
axis([-10 10 -10 10]);



%% 
% Question 4(e)
clear all
syms x(t) y(t) X Y s
x0=1;y0=-1;
ode1=diff(x)==3*x-3*y+2;
ode2=diff(y)==-6*x-t;
lode1=laplace(ode1,t,s);
lode2=laplace(ode2,t,s); 
lode1=subs(lode1,{laplace(x(t),t,s),laplace(y(t),t,s),x(0)},{X,Y,x0});
lode2=subs(lode2,{laplace(x(t),t,s),laplace(y(t),t,s),y(0)},{X,Y,y0});
sol=solve([lode1 lode2],[X Y]);
X=sol.X;
Y=sol.Y;
x=ilaplace(X,s,t);
y=ilaplace(Y,s,t);
disp('Solution of the IVP')
disp('x(t)=');
disp(simplify(x))
disp('y(t)=')
disp(simplify(y))

figure(5)
hold on
fplot([x y],'Linewidth',2)
grid on
axis([-5 5 -5 5])










