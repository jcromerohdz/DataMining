V1 <- c(1,2,3,4,5)
V2 <- c(6,7,8,9,10)

res1 <- V1 + V2
res1
res2 <- V1 * V2
res2
res3 <- V2 - V1
res3
res4 <- V1 / V2
res4

#2 part 
x <- rnorm(5)
x

for(i in x){
    print(i)
}

N <- 100
a <- rnorm(N)
b <- rnorm(N)

# Vectorized approach
c <- a * b
c

# De-vectorized approach
d <- rep(NA, N)
for(i in 1:N){
    d[i] <- a[i] * b[i]
}
d

