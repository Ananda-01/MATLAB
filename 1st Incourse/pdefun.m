function [c,f,s] = pdefun(x,t,u,DuDx)
    c = [1; 1];
    f = [DuDx(1); DuDx(2)];
    s = [u(1)*(1 - u(1) - u(2)); u(2)*(1 - u(1) - u(2))];
end
