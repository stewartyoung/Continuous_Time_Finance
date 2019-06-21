#ornstein-Uhlenbeck is most common for interest rate modelling

require(yuima)
m1=setModel(drift="theta*(mu-x)",diffusion="sigma", state.var="x",time.var="t",solve.var="x",xinit=0.5)

#theta is speed of reversion to the mean
#note how system reverts to mean = 0.1
X=simulate(m1,true.param=list(mu=0.1,sigma=0.2,theta=2))
plot(X)


require(yuima)
m1=setModel(drift="theta*(mu-x)",diffusion="sigma", state.var="x",time.var="t",solve.var="x",xinit=0.5)
X=simulate(m1,true.param=list(mu=0.1,sigma=0.2,theta=2))
plot(X)
simnum=100
dist=c(.31, .52,0.6,0.7, .95)
newsim=function(i){simulate(m1,true.param=list(mu=0.1,sigma=0.2,theta=2))@data@original.data}
newsim(1)
sim=sapply(1:simnum,function(x)newsim(x))
m2=t(sim)
apply(m2,2,mean)
tile=sapply(1:100,function(x)quantile(m2[,x], dist) )
tile
