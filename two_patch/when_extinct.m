function [t,flag]=when_extinct(w,lm)
global kdisp 
delta=.005;
a=.61;
r=8;
eta=5;
define_k(eta,delta);
u1=twopatchinit(w);
sz=1;
t=0;
%%%%%one patch
load('uequpatch.mat','uequpatch');
flag=0;
%%%%%
while sz~=0&&t<lm&&flag==0
    u1=nextgen(a,r,u1);
      [sz,u1]=size_clip(a,u1);
      %%%%one patch
      if u1(1)>.8
         l1=length(u1);
         l=max(937,l1);
          diff=max(abs([uequpatch,zeros(1,l-937)]-[u1,zeros(1,l-l1)]));
          if diff<10^(-6)
              flag=1;
              t=8.5;
              break
          end
      end
      %%%%%
      t=t+1;
end
end