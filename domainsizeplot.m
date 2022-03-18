function [dom_size,dens_curves]=domainsizeplot(a,r,eta,p0,w0,n)
global kdisp
dens_curves=cell(1,n);
delta=.005;
define_k(eta,delta);
dom_size=zeros(1,n);
u1=initialize(p0,w0,delta);
[sz,u1]=size_clip(a,u1);
dom_size(1)=delta*sz;
dens_curves{1}=u1;
for j=2:n
    u1=nextgen(a,r,u1);
    [sz,u1]=size_clip(a,u1);
    dom_size(j)=delta*sz;
    dens_curves{j}=u1;
end
plot(dom_size,'-o');
end