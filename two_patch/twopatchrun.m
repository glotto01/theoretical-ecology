function twopatchrun(w0,w1,n)
tic
% saves [w,pop,time] for each value of width iterated over, where
% population is the total poplation after fixed point condition reached,
% and time is how many generation to reach it
global kdisp 
%setup prelims
delta=.005;
a=.61;
r=8;
eta=5;
define_k(eta,delta);
ep=10^(-6);
data=zeros(n,3);
%loop over seperation width
ww=linspace(w0,w1,n);
for m=1:n
  u0=twopatchinit(ww(m));
  diff=ep+1;
  t=0;
  while or(t<20,diff>ep)
      t=t+1;
      u1=nextgen(a,r,u0);
      [sz,u1]=size_clip(a,u1);
      if sz==0
          u0=0;
          break
      end
      l0=length(u0);
      l1=length(u1);
      l=max(l0,l1);
      diff=max([u0,zeros(1,l-l0)]-[u1,zeros(1,l-l1)]);
      u0=u1;
  end
  pop=sum(u0)*delta*2;
  data(m,:)=[ww(m),pop,t];
end
csvwrite('twopatchinteraction.csv',data)
toc
end