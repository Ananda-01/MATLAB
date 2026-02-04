clc,
clear all
close all 
fprintf('stabilitiy interval (%.4f %.4f)',0,2/3) 
syms y(x) 
y1=dsolve(diff(y)==-3*y,y(0)==1);

figure(1) 
hold on 
fplot(y1,'linewidth',2) 
plot(0,1,'.r','MarkerSize',30) 

clear x y 
f=@(x,y)-3*y;
a=0;b=1;n=10;
h=[0.4 0.6 0.7 0.8]; % check stability
x=linspace(a,b,n+1);
y=zeros(1,n);
y(1)=1;

for j=1:length(h) 
    for i=2:n+1
        y(i)=y(i-1)+h(j)*f(x(i-1),y(i-1));
    end 
    plot(x,y,'o-','linewidth',2) 
end 
axis([0 1 -5 5]);
grid on 
legend('exact','ip','h=0.4','h=0.6','h=0.7','h=0.8') 
