clc,
clear all,
close all

% Define the objective function
f=[2,3]; 

% Define Inequality Constraints
A=[-1 1;2 1;1 2];
b=[0 12 14];

% Equality constraints
Aeq=[];
beq=[];

lb = [2, 1];  % Lower bounds 
ub = [5, 4];  % Upper bounds 

% Solve the LP Problem
options = optimoptions('linprog', 'Display', 'none');
[x,z]=linprog(f,A,b,Aeq,beq,lb,ub,[],options);
disp('Optimal value')
disp(x)
disp('Optimal solution')
disp(z)

%%
% Plot the feasible region
% Question 1 a
clc
clear all
close all


u=linspace(2,5,200);
v=linspace(1,4,200);
[x,y] = meshgrid(u,v);
m1 = x-y>=0;
m2 = 2*x+y<=12;
m3 = x+2*y<=14;
m=m1 & m2 & m3;
P=[x(m),y(m)];  % list of feasible points
k=convhull(P(:,1),P(:,2)); % Compute the convex hull
fill(P(k,1),P(k,2),'b','edgecolor','r','linewidth',2) % Fill the feasible region
title('feasible region')
xlabel('x')
ylabel('y')

%%
% Q 1 b
clc,
clear all
close all

% Objective function
f=[4 3 -1];

% Inequality contraints
A=[1 1 1;-2 1 -2];
b=[10 -4];

% Equality constraints
Aeq=[];
beq=[];

% Lower and upper bound
lb=[0 1 1];
ub=[2 4 Inf];

% Solve the LP problem
options = optimoptions('linprog', 'Display', 'none');
[x,z]=linprog(-f,A,b,Aeq,beq,lb,ub,[],options);
disp('Optimal solution')
disp(x)
disp('Optimal value')
disp(-z)

%%
% Question 1(b) -> ii
clc
clear all
close all

% Objective function
f=[4 3 -1];

% Inquality constraints
A=[1 1 1;-2 1 -2];
b=[10 -4];

% Equality constraints
Aeq=[];
beq=[];

% Lower and upper bound
lb=[0 1 0]; 
ub=[0 4 Inf];
alpha=1:0.5:4;
beta=1:0.5:3;

fprintf('%4s %4s  %8s  %8s  %8s  %8s\n','alpha','beta','x1','x2','x3','Zmax') 
options = optimoptions('linprog', 'Display', 'none');
for i=alpha
    for j=beta
        ub(1)=2*i;
        lb(3)=j;
        [x,z]=linprog(-f,A,b,Aeq,beq,lb,ub,[],options);
        fprintf('%4.2f  %4.2f  %8.4f  %8.4f  %8.4f  %8.4f\n',i,j,x(1),x(2),x(3),-z)
    end 
end




%%
% Question 1 b
% Plot the feasible region

clc
clear all
close all

u = linspace(0,2,100);
v = linspace(1,4,100);
w = linspace(0,8,100);
[x,y,z] = meshgrid(u,v,w);

m1 = x+y+z <= 10;
m2 = 2*x-y+2*z >= 4;
m = m1 & m2;
k=convhull(x(m),y(m),z(m));
trisurf(k,x(m),y(m),z(m),'facecolor','cyan','edgecolor','k')
xlabel('x')
ylabel('y')
zlabel('z')
axis tight

%%
%Q1(b) ->(iii)
clc,
clear all
close all

% Objective function
f=[4 3 -1];

% Inquality constraints
A=[1 1 1;-2 1 -2];
b=[10 -4];

% Equality contraints
Aeq=[];
beq=[];

% Lower and upper bound
lb=[0 1 1]; 
ub=[2 Inf Inf];

% Solve the LP peoblem
options = optimoptions('linprog', 'Display', 'none');
[x,z,exitflag]=linprog(-f,A,b,Aeq,beq,lb,ub,[],options);

if exitflag == 1
    disp('Optimal solution')
    disp(x)
    disp('Optimal value')
    disp(-z)
end