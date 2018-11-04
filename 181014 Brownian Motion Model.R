#required package
install.packages("yuima", repos="http://cran.rstudio.com")
require(yuima)


#setting brownian motion model
bmmodel=setModel(drift="0",diffusion="1",state.variable="x",time.variable="t",
               solve.variable="x",xinit=100)

#simulate and plot
X=simulate(bmmodel)
plot(X)

#see the values that were plotted
d1=X@data@original.data
d1

#increasing n in grid makes the motion more "choppy"
grid=setSampling(Terminal=1, n=500)
X=simulate(bmmodel,sampling=grid)
plot(X)

