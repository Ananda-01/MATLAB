clc
clear all
close all
% ques-1(a)
u=[1,-7,12];
v=[-3,2,10];
w=[8,2,-1];
if dot(u+v,w)==dot(u,w)+dot(v,w)
    disp('Verified')
else
    disp('Not verified')
end

%%
clc
clear all
close all
% ques-1(b)
u=[1,-7,12];
v=[-3,2,10];
inprod=dot(u+v,3*u-2*v)

%%
clc
clear all
close all
% ques-1(c)
u1=[-3/5,4/5,0];
u2=[4/5,3/5,0];
u3=[0,0,1];
% check Orthonormal basis
if dot(u1,u2)==dot(u1,u3)==dot(u2,u3)==0 && norm(u1)==norm(u2)==norm(u3)==1
    disp('Verified')
else
    disp('Not verified')
end

%%
clc
clear all
close all
% ques 3
% determine inner product using for loop
a=[9,8,7;6,5,4];
b=[1,2,3;4,5,6];
c=0;
for i=1:2
   for j=1:3
    c=c+a(i,j)*b(i,j);
   end
end
disp(c)
%%
clc
clear all
close all
% ques 3
% determine inner product using while loop
a=[9,8,7;6,5,4];
b=[1,2,3;4,5,6];
c=0;
i=1;j=1;
while i<=2
    while j<=3
           c=c+a(i,j)*b(i,j);
           j=j+1;
    end
    j=1;
    i=i+1;
end
disp(c)
%%
clc
clear all
close all
% ques 3
% determine norm using for loop
a=[9,8,7;6,5,4];
norm_a=0;
for i=1:2
    for j=1:3
        norm_a=norm_a+a(i,j)^2;
    end
end
norm_a=sqrt(norm_a);
disp(norm_a)
%%
clc
clear all
close all
% ques 3
% determine inner product using while loop
a=[9,8,7;6,5,4];
norm_a=0;
i=1;j=1;
while i<=2
    while j<=3
           norm_a=norm_a+a(i,j)^2;
           j=j+1;
    end
    j=1;
    i=i+1;
end
norm_a=sqrt(norm_a);
disp(norm_a);

%%
clc
clear all
close all
% ques 2
u1=[-3/5,4/5,0];
u2=[4/5,3/5,0];
u3=[0,0,1];
v=[1,1,1];
u={u1,u2,u3}
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
% ques 4
v1=[1,-1,1];
v2=[1,0,1];
v3=[1,1,2];
v={v1,v2,v3};
w={};
for i=1:3
    u=v{i};
    for j=1:length(w)
        u=u-dot(v{i},w{j})*w{j}/dot(w{j},w{j});
    end
    w{i}=u;
end
disp('orthogonal basis w:')
for i=1:length(w)
    disp(w{i});
end


%%
clc
clear all
close all
% ques 5
syms u v
x=2*u-v;
y=3*u+2*v;
T(u,v)=[x,y];
T(1,-2)

%%
clc
clear all
close all
syms u v
[u,v]=meshgrid(-3:3,-2:2);
x=2*u-v;
y=3*u+2*v;
subplot(1,2,1)
plot(u,v,'r*')
grid on
hold on
subplot(1,2,2)
plot(x,y,'k*')
grid on

%%
clc
clear all
close all
% ques 6
u1=[1,1,1];
u2=[-2/3,1/3,1/3];
u3=[0,-1/2,1/2];
v=[1,2,3];
u={u1,u2,u3};
proj=0;
for i=1:3
    proj=proj+(dot(v,u{i})/norm(u{i})^2)*u{i};
end
proj

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
s=[u1;u2;u3;u4]
g=solve(a*u1+b*u2+c*u3+d*u4==v,a,b,c,d)
 A=g.a 
 B=g.b 
 C=g.c 
 D=g.d
fprintf('v=%0.2f*u1+%0.2f*u2+%0.2f*u3+%0.2f*u4',A,B,C,D)

%%
clc
clear all
close all
% ques 8
syms x y z
f(x,y,z) = 3*x^2-2*y^2+z^2+8*x*y+x*z-5*y*z;
A=[3 4 1/2;4 -2 -5/2;1/2 -5/2 1];
X=[x;y;z];
xt=transpose(X)
Q(x,y,z)=xt*A*X;
simplify(Q)
Q(-1,2,1)
% Q=X'*A*X;
% if Q==f(x,y,z)
%     disp('can be written as Q=x.A.x')
% else
%     disp('cannot be written as Q=x.A.x')
% end
    








