rm(result)
x <- rnorm(1)

if(x > 1){
  result <- "Greater than 1"
}else if(x >= -1){
    result <- "Between -1 and 1"
}else{
  result <- "Less than -1"
}

