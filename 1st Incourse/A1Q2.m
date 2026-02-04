clc
clear all
close all

%%
% Question 2 -> a
syms y(x)
y1 = dsolve(diff(y) == x^2-2*y,y(-2)==1);
disp('Paritcular solution')
disp(y1)
% Plot the soution trajectory
figure(1);
hold on
fplot(y1,'Linewidth',2)
plot(-2,1,'.r','MarkerSize',25)
grid on
axis([-5 5 -5 5])
hold off


%%
% Question 2(b)
[x,y] = meshgrid(-5:5, -5:5);
u=1;
v=x^2-2*y;
n=sqrt(u^2+v^2);
u=u./n;
v=v./n;
figure(2)
hold on
quiver(x,y,u,v,'Linewidth',2)
axis tight
grid on

% Sketh an approximate solution curve
clear x y
syms y(x)
x0=[3 0 0];
y0=[0 2 0];
for k=1:length(x0)
    y2 = dsolve(diff(y) == x^2-2*y, y(x0(k)) == y0(k));
    fplot(y2,'Linewidth',2)
    plot(x0(k),y0(k),'k','MarkerSize',25)
end
axis([-5 5 -5 5])
hold off

%%
% Question 2(c)
clear all
xspan1 = [-2 5];
xspan2 = [-2 -5];
y0 = 1;
[x1,y1] = ode45(@odefun,xspan1,y0);
[x2,y2] = ode45(@odefun,xspan2,y0);
x = [flip(x2);x1];
y = [flip(y2);y1];
figure(3);
hold on
plot(x,y,'Linewidth',2)
plot(-2,1,'.r','MarkerSize',25)
grid on;
axis([-5 5 -5 5]);
hold off




%% 
clc
clear all
close all 
% Question 2(d)
a=0;b=1;n=50;
h=(b-a)/n;
X=a:h:b;
W=zeros(1,n);
W(1)=1;
f = @(x,y)x^2-2*y;
for i=2:n+1
    W(i)=W(i-1)+h*(f(X(i-1),W(i-1)));
end  

syms exact(x) y(x)
exact(x)=dsolve(diff(y)==x^2-2*y,y(0)==1);
Y=double(exact(X));
err=double(abs(Y-W));
table_1=table(transpose(X),transpose(W),transpose(Y),transpose(err),'VariableNames',{'X','euler','exact','error'});
disp(table_1) 
figure(1) 
hold on 
plot(X,W,'bo-') 
plot(X,Y,'linewidth',2) 
legend('euler','exact') 



















