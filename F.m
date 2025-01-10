% ques 3
% lagrange interpolation formula
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
for i=1:n;
    sum=sum+L(i)*y(i);
end
Y=sum
end