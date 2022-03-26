function uout=twopatchinit(w)
%w is peak to peak spacing: i.e. uout=ueq(x+w/2)+ueq(x-w/2)
load('uequpatch.mat','uequpatch');
delta=.005;
L=length(uequpatch);
hwn=round(w/(2*delta));
if hwn<L
uout=[flip(uequpatch(2:hwn+1)) uequpatch];
uout=uout+[uequpatch(hwn+1:L) zeros(1,2*hwn)];
elseif hwn>=L
    uout=[zeros(1,hwn-L+1) flip(uequpatch(2:L)) uequpatch];
end
end