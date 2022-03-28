function pop=count_patches(Lscale)
global kdisp
a=.61;
r=8;
eta=5;
Ltot=500;
ep=10^-6;
delta=.005;
define_k(eta,delta);
u0=randinitial(Ltot,Lscale);
for n=1:10
    u1=u0;
for m=1:50
    u1=nextgen(a,r,u1);
    [~,u1]=size_clip(a,u1);
end
l0=length(u0);
l1=length(u1);
l=max(l0,l1);
diff=max(abs([u0,zeros(1,l-l0)]-[u1,zeros(1,l-l1)]));
u0=u1;
if diff<ep*50
    break
end
end
plot(u0);
pop=round(delta*sum(u0)/(2*1.8476));
end
