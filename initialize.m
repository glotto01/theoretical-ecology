function u0=initialize(p0,w0,delta)
n=floor(w0/(2*delta));
u0=arrayfun(@(x)p0*cos(pi*delta/w0*x),(0:n));
end
