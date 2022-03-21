function initialcondgrid(p00,p01,np,w00,w01,nw)
tic
a=.61;
r=8;
eta=5;
data=repmat(-1,np,nw);
pval=linspace(p00,p01,np);
wval=linspace(w00,w01,nw);
for mp=1:np
    for mw=1:nw
        data(mp,mw)=characterize_patch(a,r,eta,pval(mp),wval(mw));
    end
end
csvwrite('initgrid_patch.csv',data);
toc
end