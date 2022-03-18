function [dsz,uout]=size_clip(a,uin)
%prunes the right values less than Allee threshold, and gives domain size
%in integer units
n=length(uin);
if n==1
    dsz=0;
    uout=0;
    return
end
b=n;
clip=n;
while and(uin(b)<a,b>1)
    if uin(b)<10^-4
        clip=b-1;
    end
    b=b-1;
end
uout=uin(1:clip);
if b==1
    dsz=0;
    return
end
dsz=(a-uin(b-1))/(uin(b)-uin(b-1))+b-1;
end
