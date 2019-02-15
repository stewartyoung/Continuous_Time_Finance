require(yuima)
m1=setModel(drift="theta*(mu-x)",diffusion="sigma*(x^{0.5})", state.var="x",time.var="t",solve.var="x",xinit=0.15)
X=simulate(m1,true.param=list(mu=0.2,sigma=0.2,theta=2))
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
