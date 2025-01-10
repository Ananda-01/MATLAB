function [Y]=G(X)
x=[0.0 1.2 1.4 1.6 1.8 2.0];
y=[.242 .1942 .1497 .1109 .079 .054];
n=length(x);
F=zeros(n);
F(:,1)=y';
for j=2:n
    for i=j:n
        F(i,j)=(F(i,j-1)-F(i-1,j-1)) /(x(i)-x(i-j+1));
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

