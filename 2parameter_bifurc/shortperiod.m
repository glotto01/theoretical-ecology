function isperiodic=shortperiod(u)
isperiodic=false;
lu=length(u);
ep=10^-4;
last=u(end);
test=0;
for k=1:16
    if abs(u(lu-k)-last)<ep
    test=k;
    break
    end
end
if test~=0
    a=u(lu-k+1:lu);
    b=u(lu-2*k+1:lu-k);
	c=max(arrayfun(@(x)abs(x),b-a));
    if c<ep
        isperiodic=true;
       % k
    end
end
end