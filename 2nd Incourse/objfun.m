function f=objfun(x)
global funval
f=100*( x(2) + 2*x(1)^2 ) + (1-3*x(1)^2);
funval=[funval,f];
end