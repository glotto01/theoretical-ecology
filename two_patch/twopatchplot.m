function twopatchplot(w,n)
tic
global kdisp 
delta=.005;
a=.61;
r=8;
eta=5;
define_k(eta,delta);
u1=twopatchinit(w);
pop=zeros(1,n);
pop(1)=2*delta*sum(u1);
for k=2:n
    u1=nextgen(a,r,u1);
      [~,u1]=size_clip(a,u1);
      pop(k)=2*delta*sum(u1);
end
u1(1)
figure(1)
plot(pop)
figure(2)
plot(u1)
toc
end