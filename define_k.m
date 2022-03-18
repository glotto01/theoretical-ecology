function define_k(eta,delta)
global kdisp
c=sqrt(gamma(3/eta+1)/(12*gamma(1/eta+1)^3));
sigma=sqrt(3*gamma(1/eta+1)/gamma(3/eta+1));
xmax=sigma*log(c*10^4)^(1/eta);
n=ceil(xmax/delta);
kdisp=arrayfun(@(x)delta*c*exp(-abs(delta*x/sigma)^eta),-n:n);
end

