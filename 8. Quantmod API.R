require(yuima)
#reading data from online
#read= read.csv("http://chart.yahoo.com/table.csv?s=goog&g=d&x=.csv")
#wget "http://real-chart.finance.yahoo.com/table.csv?s=GE&a=10&b=28&c=2017&d=10&e=28&f=2018&g=d"

install.packages("quantmod")
library(quantmod)

getSymbols("GOOGL",from = "2017-11-06",to="2018-11-06",auto.assign=TRUE)

close<-GOOGL$GOOGL.Close

mean(close)

ts.plot(close)



D=setYuima(data=setData(GOOGL$GOOGL.Close))
D
str(D@data)


m1=setModel(drift="theta*(mu-x)",diffusion="sigma", state.var="x",time.var="t",solve.var="x",xinit=0.5)
X=simulate(m1,true.param=list(mu=0.1,sigma=0.2,theta=2))
initialise=list(mu=0.05,sigma=0.5,theta=1)
lowbound=list(mu=0,sigma=0,theta=0)
upbound=list(mu=0.2,sigma=2,theta=3)

#quasi-likelihood estimation
mle=qmle(X,start=initialise,lower=lowbound,upper=upbound)
summary(mle)
plot(mle)
