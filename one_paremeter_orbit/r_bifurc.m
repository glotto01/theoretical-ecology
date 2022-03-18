(* ::Package:: *)

function data=r_bifurc(a,r0,r1,eta,p0,w0,n)
tic
global kdisp
delta=.005;
define_k(eta,delta);
u0=initialize(p0,w0,delta);
r=linspace(r0,r1,n);
trns=400;
keep=200;
data=zeros(n,keep+1);
% loop through a values
for h=1:n
    data(h,1)=r(h);   
    % run through transients
    u1=u0;
    for j=1:trns
        u1=nextgen(a,r(h),u1);
    [sz,u1]=size_clip(a,u1);
    end
    % store domain size values
    for j=1:keep
        data(h,j+1)=sz*delta*2;
        u1=nextgen(a,r(h),u1);
    [sz,u1]=size_clip(a,u1);
    end
end 
csvwrite('r_bifurc.csv',data);
toc
end
