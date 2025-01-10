%  1 a
clc
clear all
close all
u=[1,-7,12];
v=[-3,2,10];
w=[8,2,-1];
if dot(u+v,w)==dot(u,w)+dot(v,w)
    disp('verified')
else
    disp('Not verified')
end

%%
% 1 b
clc
clear all
close all
u=[1,-7,12];
v=[-3,2,10];
w=[8,2,-1];
pr=dot(u+v,3*u-2*v)

%%
% 1 c
clc
clear all
close all
u=[1,-7,12];
v=[-3,2,10];
w=[8,2,-1];
if dot(u,v)==dot(u,w)==dot(v,w)==0 && norm(u)==norm(v)==norm(w)==1
    disp('construct orthonormal basis')
else
    disp('Not orthonormal basis')
end

%% 
% 2
clc
clear all
close all
u1=[-3/5,4/5,0];
u2=[4/5,3/5,0];
u3=[0,0,1];
v=[1,1,1];
u={u1,u2,u3};
proj=0;
for i=1:3
    proj=proj+(dot(v,u{i})/norm(u{i})^2)*u{i};
end
proj
component=round(v-proj)
%%
clc
clear all
close all
u1=[-3/5,4/5,0];
u2=[4/5,3/5,0];
u3=[0,0,1];
v=[1,1,1];
u={u1,u2,u3}
proj=0
for i=1:3
    proj=proj+(dot(v,u{i})/norm(u{i})^2)*u{i}
end
proj

%%
% 3
clc
clear all
close all
a=[9 8 7;6 5 4];
b=[1 2 3;4 5 6];
% inner product using for loop
c=0;
for i=1:2
    for j=1:3
        c=c+a(i,j)*b(i,j);
    end
end
c

%%
% 3
clc
clear all
close all
a=[9 8 7;6 5 4];
b=[1 2 3;4 5 6];
% inner product using while loop
c=0;
i=1;
j=1;
while i<=2
    while j<=3
        c=c+a(i,j)*b(i,j)
        j=j+1
    end
    j=1
    i=i+1
end
c

%%
% 3
clc
clear all
close all
a=[9 8 7;6 5 4];
b=[1 2 3;4 5 6];
% norm using for loop
c=0;
for i=1:2
    for j=1:3
        c=c+a(i,j)^2
    end
end
norm_a=sqrt(c)

%% 
% 3
clc
clear all
close all
a=[9 8 7;6 5 4];
b=[1 2 3;4 5 6];
% norm using while loop
c=0;
i=1;
j=1;
while i<=2
    while j<=3
        c=c+a(i,j)^2;
        j=j+1;
    end
    j=1;
    i=i+1;
end
norm_a=sqrt(c)
        
%%
% 4
clc
clear all
close all
v1=[1,-1,1];
v2=[1,0,1];
v3=[1,1,2];
% apply gram-schmidt process
v={v1,v2,v3};
w={};
for i=1:3
    u=v{i};
    for j=1:length(w)
        u=u-(dot(v{i},w{j})/dot(w{j},w{j}))*w{j};
    end
    w{i}=u 
end
for i=1:length(w)
    disp(w{i})
end

%%
% 5 i
clc
clear all
close all
syms u v
x=2*u-v;
y=3*u+2*v;
T(u,v)=[x,y];
T(-1,2)

%% 
% 5 ii
clc
clear all
close all
syms u v
x=@(u,v) 2*u-v;
y=@(u,v) 3*u+2*v;
T=@(u,v)[x(u,v),y(u,v)]
for u=-3:3
    for v=-2:2
        fprintf('T(%d,%d)==(%d,%d)',u,v,x(u,v),y(u,v))
    end
end
%%
% 5
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
% 7
clc
clear all
close all
syms a b c d
u1=[1,-2,3,-4];
u2=[2,1,-4,-3];
u3=[-3,4,1,-2];
u4=[4,3,2,1];
v=[-1,2,3,7];
s=[u1;u2;u3;u4];
g=solve(a*u1+b*u2+c*u3+d*u4==v,a,b,c,d)
A=g.a
B=g.b
C=g.c
D=g.d
fprintf('v=%0.2f*u1+%0.2f*u2+%0.2f*u3+%0.2f*u4',A,B,C,D)

%%
% 8
clc
clear all
close all
syms x y z
f(x,y,z) = 3*x^2-2*y^2+z^2+8*x*y+x*z-5*y*z;

%%
% practice 4

clc
clear all
close all
syms u y
v1=[1,1,1,1];
v2=[0,1,1,1];
v3=[0,0,1,1];
v={v1,v2,v3};
w={};
for i=1:3
    u=v{i}
    for j=1:length(w)
        u=u-(dot(v{i},w{j})/dot(w{j},w{j}))*w{j};
    end
    w{i}=u
end
y1=w{1}
y2=w{2}
y3=w{3}
if dot(y1,y2)==dot(y1,y3)==dot(y2,y3)==0
    disp('orthogonal')
else
    disp('No')
end
% normalize the vector
z1=y1/norm(y1)
z2=y2/norm(y2)
z3=y3/norm(y3)

%% 
% practice 5
clc
clear all
close all
syms u v
x=2*u-v;
y=












