% Define the PDE function
function[c,f,s] = pdefun5(x,t,u,dudx)
  alpha=3;
  c=1;
  f=alpha*dudx;
  s=0;
end