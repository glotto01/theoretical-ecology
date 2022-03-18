(* ::Package:: *)

function data=eta_bifurc(a,r,eta0,eta1,p0,w0,n)
tic
global kdisp
delta=.005;
u0=initialize(p0,w0,delta);
eta=arrayfun(@(x)eta0*(eta1/eta0)^((x-1)/(n-1)),1:n);
trns=400;
keep=200;
data=zeros(n,keep+1);
% loop through a values
for h=1:n
    data(h,1)=eta(h);   
    define_k(eta(h),delta);
    % run through transients
    u1=u0;
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
csvwrite('eta_bifurc.csv',data);
toc
end
