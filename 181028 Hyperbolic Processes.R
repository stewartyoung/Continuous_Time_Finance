require(yuima)
m1=setModel(drift="theta*x/((1+x^2)^{0.5})",diffusion="1", state.var="x",time.var="t",solve.var="x",xinit=0.5)
X=simulate(m1,true.param=list(theta=1))
plot(X)
