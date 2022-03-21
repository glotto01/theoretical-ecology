function whatisit=characterize_patch(a,r,eta,p0,w0)
%0=extinct, 
global kdisp
delta=.005;
define_k(eta,delta);
u1=initialize(p0,w0,delta);
[sz,u1]=size_clip(a,u1);
%iterate 32 times as first pass transient filter
for m=1:32
    u1=nextgen(a,r,u1);
    [sz,u1]=size_clip(a,u1);
end
%test for grow/extinct
if sz==0
    whatisit=0;
    return
end
data=zeros(1,32);
m=0;
%outer loop
while m<16
    %32 iterations
    for t=1:32
        u1=nextgen(a,r,u1);
        [sz,u1]=size_clip(a,u1);
        data(t)=sz;
    end
    %do the tests on data
    if sz==0
        whatisit=0;
        return
    elseif shortperiod(data)
       whatisit=round(sum(u1)*delta/1.8476);
        return
    end
    m=m+1;
end
whatisit=round(sum(u1)*delta/1.8476);

end