clear; 
clc; 
close all;

%%
% Task 2(a)

clc
clear all
close all

n_values=[2000, 4000, 8000, 16000, 32000, 64000, 128000, 256000, 512000, 1024000];
var=zeros(length(n_values),3);

for i=1:length(n_values)
    n=n_values(i);
    x=linspace(0,1,n+1);
    f=sin(2*pi*x);
    df=diff(f);
    % Compute the variation
    f1=sum(abs(df));
    f2=sum(abs(df.^2));
    f3=sum(abs(df.^3));
    var(i,:)=[f1,f2,f3];
end

% Plotting
subplot(3,1,1) % subplot(row,col,which subplot is active)
loglog(n_values,var(:,1),'o-')
xlabel('n');ylabel('First variation');
title('First variation vs n')
grid on

subplot(3,1,2)
loglog(n_values,var(:,2),'o-')
xlabel('n');ylabel('Second variation')
title('Second variation vs n')
grid on

subplot(3,1,3)
loglog(n_values,var(:,3),'o-')
xlabel('n'); ylabel('Third variation');
title('Third variation vs n')
grid on

% What does it mean by this variation
%--> First varition is unbounded.It is so wiggly and moves back and
% forth so fast the length would be infinite.

%--> Second varition is finite and = to the elapsed time (t).

%--> Third varition is 0. Because the steps in BM are very small, 
% When you add up an infinite number of these nearly zero.

    


%%
% Task 2(b)
clc
clear all
close all

n_values=[2000, 4000, 8000, 16000, 32000, 64000, 128000, 256000, 512000, 1024000];
var=zeros(length(n_values),3);

for i=1:length(n_values)
    n=n_values(i);
    dt=1/n;
    % Construction BM
    w=[0 cumsum(sqrt(dt)*randn(1,n))];
    dw=diff(w);
    f1=sum(abs(dw));
    f2=sum(dw.^2);
    f3=sum(abs(dw.^3));
    var(i,:)=[f1,f2,f3];
end

% plotting
subplot(3,1,1)
loglog(n_values,var(:,1),'o-')
xlabel('n');ylabel('First variation');
title('First variation vs n')
grid on

subplot(3,1,2)
loglog(n_values,var(:,2),'o-')
xlabel('n');ylabel('Quadratic variation')
title('Quadratic variation vs n')
grid on

subplot(3,1,3)
loglog(n_values,var(:,3),'o-')
xlabel('n');ylabel('Third variation');
title('Third variation vs n')
grid on
