function u0=randinitial(Ltot,Lscale)
delta=.005;
pad=5;
uh=1.2;
ul=.8;
upad=zeros(1,ceil(pad/delta));
n=ceil(Ltot/Lscale)+1;
y=arrayfun(@(x)ul+(uh-ul)*x,rand(1,n));
m=round(Ltot/delta);
u0=interp1(1:n,y,linspace(1,n,m));
u0=[upad,u0];
end