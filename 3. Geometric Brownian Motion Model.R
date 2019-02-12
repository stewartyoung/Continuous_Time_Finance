#required package
require(yuima)

#set the model
gbmmodel=setModel(drift= "mu*s", diffusion = "sigma*s", state.var = "s", time.variable = "t", solve.variable = "s",xinit=100)
X=simulate(gbmmodel, true.param=list(mu=0.1,sigma=0.2))
plot(X)
