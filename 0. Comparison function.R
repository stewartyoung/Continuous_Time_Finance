myfunction <- 
  function(x,y, print=TRUE){
  if (x>y){
    print(paste(c(x,"is bigger than",y),collapse=" "))
    }
    else if (x<y){
      print(paste(c(y,"is the supremum of (x,y)"),collapse = " "))
    }
    else {
      print(paste(c(x,"is equal to",y),collapse = " "))
    }
  }


xs=c(1,2,3,4,5,6)
ys=c(6,5,4,3,2,1)

for (x in xs){
  for (y in ys){
    myfunction(x,y)
      }
}

