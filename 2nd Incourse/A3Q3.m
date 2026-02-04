% Question -->3(a)
 clc
 clear all
 close all
 
 % Plot the solution trajactories of Prey-predator model
 a=0.1; b=0.02; d=0.01; g=0.1;
 x0=40; y0=8;
 t_span=[0;400];
 f=@(t,y) [a*y(1)-b*y(1)*y(2); d*y(1)*y(2)-g*y(2)];
 ic=[x0;y0];
 [t,Y]=ode45(f,t_span,ic);
 sol_x=Y(:,1);
 sol_y=Y(:,2);
 
 hold on
 plot(t,sol_x,'r-','Linewidth',2,'DisplayName','elk population')
 plot(t,sol_y,'k-','Linewidth',2,'DisplayName','wolf population')
 legend show
 xlabel('Time(t)')
 ylabel('Population')
 grid on 
 title('Lotka Volterra predator prey model.') 
 
 %%
 % Find critical points and stablity
 clc
 clear all
 close all
 
 syms x y
 a=0.1; b=0.02; d=0.01; g=0.1;
 f1=a*x-b*x*y;
 f2=d*x*y-g*y;
 F=[f1;f2];
 var=[x;y];
 J(x,y)=jacobian(F,var);
 [X,Y]=solve([f1==0; f2==0]);
 for i=1:length(X)
     p=X(i);
     q=Y(i);
     j_val=J(p,q);
     E=eig(j_val);
     fprintf('Critical points (%0.2f %0.2f)\n',p,q)
     
     % stability
    if all(real(E)<0) && all(imag(E)==0) 
        disp('Assymptotically stable node.') 
    elseif all(real(E)<0) && any(imag(E)~=0) 
        disp('Assymptotically stable sprial sink') 
    elseif any(real(E)<0) && any(real(E)>0) 
        disp('Unstable and saddle point.') 
    elseif all(real(E)>0) 
        disp('Unstable and source.') 
    elseif all(real(E)==0) 
        disp('Neutrally stable(center)') 
    else 
        disp('Stability is undetermined.') 
    end
 end
 
 %%
 % Phase plane diagram
 clc
 clear all
 close all
 
 a=0.1; b=0.02; d=0.01; g=0.1;
 x0=[20,30,40,50];
 y0=[2,5,8,12];
 t_span=[0;400];
 for i=1:length(x0)
     p=x0(i);
     q=y0(i);
     ic=[p;q];
     f=@(t,y) [a*y(1)-b*y(1)*y(2); d*y(1)*y(2)-g*y(2)];
     [t,Y]=ode45(f,t_span,ic);
     sol_x=Y(:,1);
     sol_y=Y(:,2);
     
     subplot(2,2,i)
     plot(sol_x,sol_y,'linewidth',2)
     xlabel('elk population')
     ylabel('wolf population')
     title('Phase plane diagram')
 end
  

%% 
%Question 3(b): 

clc
clear all
close all 

% Plot the solution trajectory
alpha=0.6; beta=0.02; gamma=0.4; delta=0.01; lamda=0.005; kappa=0.015;
x0=40;y0=8;
tspan=[0;400];
f=@(t,y) [alpha*y(1)-lamda*y(1)^2-beta*y(1)*y(2);delta*y(1)*y(2)-gamma*y(2)-kappa*y(2)^2];
ic=[x0;y0];
[t,Y]=ode45(f,tspan,ic);
sol_x=Y(:,1);
sol_y=Y(:,2);
figure(1) 
hold on
plot(t,sol_x,'r','linewidth',2,'DisplayName','elk population.') 
plot(t,sol_y,'k','linewidth',2,'DisplayName','wolf population.') 
legend show 
xlabel('time')
ylabel('population') 
title('Predator_prey model')
grid on 

%%
% 3-->(b)
% Find critical points and stability
syms x y 
f1=alpha*x-lamda*x^2-beta*x*y;
f2=delta*x*y-gamma*y-kappa*y^2;
[X,Y]=solve([f1==0;f2==0]);
F=[f1;f2];
vars=[x;y];
J(x,y)=jacobian(F,vars);
for i=1:length(X) 
    a=X(i);
    b=Y(i);
    J_val=subs(J,[x,y],[a,b]);
    E=eig(J_val);
    fprintf('Critical point  (%.2f, %.2f)  \n',a,b ) ;
    if all(real(E)<0) && all(imag(E)==0) 
        disp('Assymptotically stable node.') 
    elseif all(real(E)<0) && any(imag(E)~=0) 
        disp('Assymptotically stable sprial sink.') 
    elseif any(real(E)<0) && any(real(E)>0) 
        disp('Unstable and saddle point.') 
    elseif all(real(E)>0) 
        disp('Unstable and source.') 
    elseif all(real(E)==0) 
        disp('Neutrally stable(center)') 
    else 
        disp('stability is undetermined,') 
    end 
end
    
    
    
%phase plane diagram:
figure(2)
x0=[20 30 40 50];
y0=[2  5 8 12] ;
tspan=[0;400];
f=@(t,y) [alpha*y(1)-lamda*y(1)^2-beta*y(1)*y(2);delta*y(1)*y(2)-gamma*y(2)-kappa*y(2)^2];

for k=1:length(x0) 
    a=x0(k);
    b=y0(k);
    ic=[a;b];
    [t,Y]=ode45(f,tspan,ic);
    sol_x=Y(:,1);
    sol_y=Y(:,2);
    subplot(2,2,k);
    plot(sol_x,sol_y,'r','linewidth',2) 
    title('Phase diagram.' );
    xlabel('elk population')
    ylabel('wolf population.') 
    grid on
end