#required package
require(yuima)

#set the gbmmodel
m1=setModel(drift="mu*s",diffusion="sigma*s", state.var="s",time.var="t",solve.var="s",xinit=100)

#simulation number
simnum=100


#quantile points
dist=c(.341,.50,0.682,0.95, .995)

newsim=function(i){simulate(m1,true.param=list(mu=0.1,sigma=0.2))@data@original.data}
newsim(1)

sim=sapply(1:simnum,function(x)newsim(x))
m2=t(sim)
m2
means=apply(m2,2,mean)
plot(means)
tile=sapply(1:100,function(x)quantile(m2[,x], dist) )
tile

mean(means)
summary(m2)
var(m2)
sd(m2)
