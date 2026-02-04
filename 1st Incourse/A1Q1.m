clc
clear all
close all

% Solve general equation
syms y(x)
y1 = dsolve(diff(y) == -y*(y+2)/(x+4));
disp('General Soution:')
disp(y1)

% Plotting Several Integral Curves
x0=[-2 -1 0 1 2];
y0=[-2 -1 0 1 2];
figure(1)
hold on
for k=1:length(x0)
    y2= dsolve(diff(y) == -y*(y+2)/(x+4),y(x0(k)) == y0(k));
    fplot(y2,'Linewidth',2)
    plot(x0(k),y0(k),'*r')
end
axis([-5 5 -5 5]);
grid on 


% Plot the particular solution
y3 = dsolve(diff(y) == -y*(y+2)/(x+4),y(-3) == -1);
disp('Particular solution through (-3,-1)')
disp(y3)
figure(2)
hold on
fplot(y3,'Linewidth',2)
plot(-3,-1,'.k','MarkerSize',25)
axis([-10 10 -10 10]);
grid on
hold off

[num den]=numden(y3);
s=solve(den==0); % find the singularities
if all(imag(s)==0) % Checking if singularities are real
    if min(s)<-3 && max(s)>-3
        fprintf('interval of validity (%4.2f %4.2f)',[min(s),max(s)])
    elseif max(s)<-3
        fprintf('interval of validity(%4.2f inf)',max(s))
    elseif min(s)>-3
        fprintf('interval of validity(-inf %4.f)',min(s))
    end
else  % If no real singularities exist 
    fprintf('All real numbers')  % The solution is valid for all real x
end
        







