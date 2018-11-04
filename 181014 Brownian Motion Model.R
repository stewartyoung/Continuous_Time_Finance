#required package
install.packages("yuima", repos="http://cran.rstudio.com")
require(yuima)


#setting brownian motion model
# "init" is initial value of a stock
# "drift" and "diffusion" coefficients as in brownian motion SDE
bmmodel=setModel(drift="0",diffusion="1",state.variable="x",time.variable="t",
               solve.variable="x",xinit=100)

#simulate and plot
X=simulate(bmmodel)
plot(X)

#see the values that were plotted
d1=X@data@original.data
d1

# "Terminal" represents terminal time of process
# "n" splits up time, such that: delta.t=Terminal/n
# increasing n in grid makes the motion more "choppy" as there are more points to be plotted
grid=setSampling(Terminal=1, n=10000)
X=simulate(bmmodel,sampling=grid)
plot(X)

