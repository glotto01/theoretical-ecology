(* ::Package:: *)

function data=p0_bifurc(a,r,eta,p00,p01,w0,n)
tic
global kdisp
delta=.005;
define_k(eta,delta);
p=linspace(p00,p01,n);
trns=400;
keep=200;
data=zeros(n,keep+1);
% loop through a values
for h=1:n
    data(h,1)=p(h);   
    % run through transients
    u1=initialize(p(h),w0,delta);
    for j=1:trns
        u1=nextgen(a,r,u1);
    [sz,u1]=size_clip(a,u1);
    end
    % store domain size values
    for j=1:keep
        data(h,j+1)=sz*delta*2;
        u1=nextgen(a,r,u1);
    [sz,u1]=size_clip(a,u1);
    end
end   
csvwrite('p0_bifurc.csv',data);
toc
end
