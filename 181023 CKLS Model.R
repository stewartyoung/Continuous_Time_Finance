require(yuima)

#this line leads to a daily sample
grid=setSampling(Terminal=1,n=1000)
m1=setModel(drift="alpha1+(alpha2*x)",diffusion="alpha3*(x^{alpha4})", state.var="x",time.var="t",solve.var="x",xinit=0.5)
X=simulate(m1,true.param=list(alpha1=0.1,alpha2=0.2,alpha3=0.3,alpha4=0.4),sampling=grid)
plot(X)


