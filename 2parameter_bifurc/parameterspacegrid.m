function parameterspacegrid(a0,a1,na,r0,r1,nr)
tic
eta=5;
p0=1;
w0=6;
data=repmat(-1,na,nr);
aval=linspace(a0,a1,na);
rval=linspace(r0,r1,nr);
for ma=1:na
    for mr=1:nr
        data(ma,mr)=characterize(aval(ma),rval(mr),eta,p0,w0);
    end
end
csvwrite('pspacegrid.csv',data);
toc
end