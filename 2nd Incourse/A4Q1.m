clc
clear all
close all

% Question 1
syms x y z;
q=[-y,-x,0];
vars=[x,y,z];
div=divergence(q,vars);
crl=curl(q,vars);
disp('Divergence=')
disp(div)
disp('Curl=')
disp(crl)

if has(div,vars) % Does the divergence depend on x, y, or z?
    disp('Divergence is a function of space, it varies from point to point.')
else
    div=double(div);
    if div>0 
        disp('Flow is divergent.')
    elseif div<0
        disp('Flow is convergent.')
    elseif div==0
        disp('Flow is solenoidal.')
    end 
end

if has(crl,vars) % Does the curl depends on x,y or z
    disp('Curl is a function of space, it varies from point to point.')
else 
    crl=double(crl);
    if crl==0
        disp('Flow is irrotational.')
    else
        disp('Flow is rotational.')
    end
end 


clear x y
[x,y]=meshgrid(-5:5,-5:5);
u=-y;
v=-x;
nrm=sqrt(u.^2+v.^2);
u=u./nrm;
v=v./nrm;
quiver(x,y,u,v,'linewidth',1.5)

xlabel('x');
ylabel('y');
title('Flow field on x-y plane.')
axis tight
