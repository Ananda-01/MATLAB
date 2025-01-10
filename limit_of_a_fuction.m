syms x
y = (1/(1+exp(1/x)));
LHL = limit(y,x,0,'left')
RHL = limit(y,x,0,'right')
ezplot(y)

%%
syms x
y = ((x^2+x)/sqrt(x^3+x^2));
LHL = limit(y,x,0,'left')
RHL = limit(y,x,0,'right')
ezplot(y)

%%
syms x
y = ((exp(x^3)-1)/(1-cos(sqrt(x-sin(x)))));
LHL = limit(y,x,0,'left')
RHL = limit(y,x,0,'right')
ezplot(y)

%%
syms x
y = (sqrt(9*x^2+x)-3*x);
LHL = limit(y,x,inf,'left')
RHL = limit(y,x,inf,'right')
ezplot(y)

%%
syms x 
y = (sqrt(x^2+a*x)-sqrt(x^2+b*x));
LHL = limit(y,x,inf,'left')
RHL = limit(y,x,inf,'right')

%%
syms x
f = exp(-1/(y^2+x^2))*(((sin(x))^2)/x^2)*(1+1/y^2)^(x+4*y^2)
LHL = limit(limit(f,x,1/sqrt(y),'left'),y,inf,'left')
RHL = limit(limit(f,x,1/sqrt(y),'right'),y,inf,'right')
if LHL == RHL
    disp('limit exists')
else
    disp('limit does not exists')
end


























