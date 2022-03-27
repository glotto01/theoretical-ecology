function run_extinct_time(w0,w1,lm,n)
tic
ww=linspace(w0,w1,n);
data=zeros(n,2);
ponecnt=0;
for k=1:n
    [t,flag]=when_extinct(ww(k),lm);
    if t==lm
        msgbox(strcat("max iteration reached on n=",string(k)," d=",string(ww(k))));
        break
    end
    if flag==1
        ponecnt=ponecnt+1;
    end
    data(k,:)=[ww(k),t];
end
csvwrite('extincttime.csv',data(1:k,:));
ponecnt
toc
end