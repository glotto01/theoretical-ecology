function [avg,sd]=comp_stat(Lscale)
tic
m=20;
dat=zeros(1,m);
for k=1:m
    dat(k)=count_patches(Lscale);
end
avg=mean(dat);
sd=std(dat);
toc
end