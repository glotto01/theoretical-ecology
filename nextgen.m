function uout=nextgen(a,r,uin)
global kdisp %dispersal vector must be set as global
M=(length(kdisp)-1)/2;
N=length(uin)-1;
gu=arrayfun(@(x) grow(a,r,x),uin);
gu(1)=0.5*gu(1);
ubar=conv(gu,kdisp);
nubar=ubar(1:M+1);
nubar=fliplr(nubar);
nubar=[nubar zeros(1,N)];
uout=nubar+ubar(M+1:2*M+N+1);
end