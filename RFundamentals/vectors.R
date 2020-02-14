# Vectors
myVector <- c(3, 45, 77, 93)
myVector
is.numeric(myVector)
is.integer(myVector)
is.double(myVector)

V2 <- c(3L, 12L, 333L, 7L)
is.numeric(V2)
is.integer(V2)
is.double(V2)

V3 <- c("a", "B23", "Hello", 2)
V3
is.character(V3)
is.numeric(V3)

seq()
rep()

seq(1,15)
1:15

seq(1, 15, 2)
z <- seq(1, 15, 4)
z

rep(3, 50)
d <- rep(3, 50)
rep("z", 5)

x <- c(80, 20)
y <- rep(x, 15)
y

a <- c(123, 234,456,3) #combine
a
b <- seq(100,200, 10)  #sequence
b
c <- rep("Hello", 3)   #replicate
c

w <- c("a", "b", "c", "d", "e")
w[1]
w[2]
w[3]
w[-1]
v <- w[-3]
v
w[1:3]
w
w[3:5]
w[c(1,2,3)]
w[c(-2, -4)]
w[c(-3:-5)]
w[1:2]
