clc
clear all
close all

syms k p0 p(t) r
ode=dsolve(diff(p)==r*p*(1-p/k),p(0)==p0);
sol(t)=simplify(ode)

% Choose fixed values of k,r,p0
R=0.4;
K=100;
p0_low=20;
p0_high=200;
sol1(t)=simplify(subs(sol(t),[r,k,p0],[R,K,p0_low]))
sol2(t)=simplify(subs(sol(t),[r,k,p0],[R,K,p0_high]))

% Plot this solution
w=linspace(0,100,250); %(0,k,250)
p1=sol1(w);
p2=sol2(w);
hold on
plot(w,p1,'b--','linewidth',2,'DisplayName','P0<K')
plot(w,p2,'m--','linewidth',2,'DisplayName','P0>K')
xlabel('t')
ylabel('p(t)')

% Plot the slope field
[T,P]=meshgrid(0:120,0:4:400);
u=1;
v=R.*P.*(1-P./K);
nrm=sqrt(u.^2+v.^2);
u=u./nrm;
v=v./nrm;
quiver(T,P,u,v,'DisplayName','Slope field')
legend show
axis([0 30 0 200]);

% Find the time when population grow the fastest
t1=double(solve(sol1(t)==K/2));
t2=double(solve(sol2(t)==K/2));
disp('Fastest growth time when P0=20,K=100:') 
disp(t1) 
disp('Fastest growth time when P0=200,K=100:') 
disp(t2)

% Comment on the dynamics of its behaviour
%We know that,
%If p(t)<k,then the population increases.
%If p(t)>k,then the population decreases.
%If t-->infinity,then p(t)-->K.
%Here,sol1(t)is increase and sol2(t) is decrease.
%Also ,t2 is complex number because p0>k so that sol2(t) is a decreasing- 
%function and there is no growth



