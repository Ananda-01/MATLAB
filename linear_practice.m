%  ques 2
clc
clear all
close all
u1=[-3/5,4/5,0];
u2=[4/5,3/5,0];
u3=[0,0,1];
v=[1,1,1];
w={u1;u2;u3}
proj=0;
for i=1:3
    proj=proj+(dot(v,w{i})/(dot(w{i},w{i})))*w{i}
end
disp(proj)

%%
clc
clear all
close all
% ques 6
u1=[1,1,1];
u2=[-2/3,1/3,1/3];
u3=[0,-1/2,1/2];
v=[1,2,3];
w={u1;u2;u3};
proj=0;
for i=1:3
    proj=proj+(dot(v,w{i})/(dot(w{i},w{i})))*w{i}
end
disp(proj)

%%
% ques 4
clc
clear all
close all
v1=[1,-1,1];
v2=[1,0,1];
v3=[1,1,2];
v={v1;v2;v3};
w={};
for i=1:3
    u=v{i};
    for j=1:length(w)
        u=u-(dot(v{i},w{j})/dot(w{j},w{j}))*w{j};
    end
    w{i}=u;
end
disp('Orthogonal of w:')
for i=1:length(w)
    disp(w{i})
end

%%
% ques 7
clc
clear all
close all
syms a b c d
u1=[1,-2,3,-4];
u2=[2,1,-4,-3];
u3=[-3,4,1,-2];
u4=[4,3,2,1];
v=[-1,2,3,7];
g=solve(a*u1+b*u2+c*u3+d*u4==v,a,b,c,d)
A=g.a
B=g.b
C=g.c
D=g.d
fprintf('v=%0.2f*u1+%0.2f*u2+%0.2*u3+%0.2*u4',A,B,C,D)

%%
clc
clear all
close all
% ques 8
syms x y z
f(x,y,z)=3*x^2-2*y^2+8*x*y-5*y*z+x*z+z^2;
A=[3 4 1;4 -2 -5/2;1 -5/2 1]
X=[x;y;z]
xt=transpose(X)
Q(x,y,z)=xt*A*X
simplify(Q)
%%
% ques 2
clc
clear all
close all
u1=[-3/5,4/5,0];
u2=[4/5,3/5,0];
u3=[0,0,1];
v=[1,1,1];
w={u1,u2,u3};
proj=0;
for i=1:3
    proj=proj+(dot(v,w{i})/(dot(w{i},w{i})))*w{i};
end
proj
%%
clc
clear all
close all
v1=[1,-1,1];
v2=[1,0,1];
v3=[1,1,2];
v={v1,v2,v3};
w={};
for i=1:3
    u=v{i};
    for j=1:length(w)
        u=u-(dot(v{i},w{j})/(dot(w{j},w{j})))*w{j};
    end
    w{i}=u;
end
for i=1:length(w)
    disp(w{i})
end


%%
clc
clear all
close all
% ques 7
syms a b c d
u1=[1,-2,3,-4];
u2=[2,1,-4,-3];
u3=[-3,4,1,-2];
u4=[4,3,2,1];
v=[-1,2,3,7];
g=solve(a*u1+b*u2+c*u3+d*u4==v);
A=g.a
B=g.b
C=g.c
D=g.d
fprintf('v=%0.2f*u1+%0.2f*u2+%0.2f*u3+%0.2fu4',A,B,C,D)
%%
clc
clear all
close all
syms x y z
f(x,y,z)=3*x^2-2*y^2+8*x*y-5*y*z+x*z+z^2;
A=[3 4 1;4 -2 -5/2;1 -5/2 1];
X=[x;y;z]
xt=transpose(X);
Q(x,y,z)=xt*A*X;
simplify(Q)

%% 
% ques 5
clc
clear all
close all
syms u v
x=2*u-v;
y=3*u+2*v;
T(u,v)=[x,y];
T(-1,2)

%%
% ques 5
clc
clear all
close all
syms u v
[u,v]=meshgrid(-3:3,-2:2);
x=2*u-v;
y=3*u+2*v;
subplot(1,2,1)
plot(u,v,'k*')
grid on
hold on
subplot(1,2,2)
plot(x,y,'r*')

%% 
clc
clear all
close all
% ques 4
v1=[1,-1,1];
v2=[1,0,1];
v3=[1,1,2];
v={v1,v2,v3};
w={};
for i=1:3
    u=v{i};
    for j=1:length(w)
        u=u-(dot(v{i},w{j})/dot(w{j},w{j}))*w{j};
    end
    w{i}=u;
end
disp('Orthogonal basis w: ')
for i=1:length(w)
    disp(w{i})
end
%%
clc
clear all
close all
u1=[-3/5,4/5,0];
u2=[4/5,3/5,0];
u3=[0,0,1];
if (dot(u1,u2)==dot(u1,u3)==dot(u2,u3)==0 && norm(u1)==norm(u2)==norm(u3)==1)
    disp('verified')
else
    disp('Not')
end
%%
clc
clear all
close all
a=[9,8,7;6,5,4];
% b=[1,2,3;4,5,6];
% using loop finding norm
norm=0;
for i=1:size(a,1)
    for j=1:size(a,2)
        norm=norm+a(i,j)^2
    end
end
norm_a=sqrt(norm)
%%
clc
clear all
close all
% a=[9,8,7;6,5,4];
b=[1,2,3;4,5,6];
norm=0;
for i=1:size(b,1)
    for j=1:size(b,2)
        norm=norm+b(i,j)^2
    end
end
norm_b=sqrt(norm)
%%
clc
clear all
close all
% inner product using while loop
a=[9,8,7;6,5,4];
b=[1,2,3;4,5,6];
prod=0;
i=1;j=1;
while i<=2
    while j<=3
        prod=prod+a(i,j)*b(i,j)
        j=j+1
    end
    j=1
    i=i+1
end
prod

%%
clc
clear all
close all
% inner product using for loop
a=[9,8,7;6,5,4];
b=[1,2,3;4,5,6];
prod=0;
for i=1:2
    for j=1:3
        prod=prod+a(i,j)*b(i,j);
    end
end
prod
%%
clc
clear all
close all
% norm using for loop
% a=[9,8,7;6,5,4];
b=[1,2,3;4,5,6];
norm=0;
for i=1:size(b,1)
    for j=1:size(b,2)
        norm=norm+b(i,j)^2;
    end
end
norm_b=sqrt(norm)
%%
clc
clear all
close all
% norm using while loop
% a=[9,8,7;6,5,4];
b=[1,2,3;4,5,6];
norm=0;
i=1;j=1;
while i<=size(b,1)
    while j<=size(b,2)
        norm=norm+b(i,j)^2
        j=j+1
    end
    j=1
    i=i+1
end
norm_b=sqrt(norm)
%%
clc
clear all
close all
% ques 4
v1=[1,-1,1];
v2=[1,0,1];
v3=[1,1,2];
v={v1,v2,v3};
w={};
for i=1:3
    u=v{i}
    for j=1:length(w)
        u=u-(dot(v{i},w{j})/dot(w{j},w{j}))*w{j};
    end
    w{i}=u
end
for i=1:length(w)
    disp(w{i})
end
%%
clc
clear all
close all
% ques 6
u1=[1,1,1];
u2=[-2/3,1/3,1/3];
u3=[0,-1/2,1/2];
v=[1,2,3];
w={u1,u2,u3};
proj=0;
for i=1:3
    for j=1:3
        proj=proj+(dot(v,w{j})/dot(w{j},w{j}))*w{j};
    end
end
proj
%%
% ques 5
clc
clear all
close all
syms u v
x=2*u-v;
y=3*u+2*v;
t(u,v)=[x,y];
t(-1,2)
%%
clc
clear all
close all
syms u v
[u,v]=meshgrid(-3:3,-2:2);
x=2*u-v;
y=3*u+2*v;
subplot(1,2,1)
plot(u,v,'k*')
grid on
hold on
subplot(1,2,2)
plot(x,y,'r*')
grid on

%% 
% ques 4
clc
clear all
close all
v1=[1,-1,1];
v2=[1,0,1];
v3=[1,1,2];
v={v1,v2,v3};
w={};
for i=1:3
    u=v{i};
    for j=1:length(w)
        u=u-(dot(v(i),w{j})/dot(w{j},w{j}))*w{j};
    end
    w{i}=u;
end
for i=1:length(w)
    disp(w{i})
end

%%
clc
clear all
close all
v1=[1,-1,1];
v2=[1,0,1];
v3=[1,1,2];
v={v1,v2,v3};
w={};
for i=1:3
    u=v{i};
    for j=1:length(w)
        u=u-(dot(v{i},w{j})/dot(w{j},w{j}))*w{j};
    end
    w{i}=u;
end
for i=1:length(w)
    disp(w{i})
end
        









