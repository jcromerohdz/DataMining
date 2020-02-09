#integer
x <- 3L
typeof(x)

#double
y <- 2.5
typeof(y)

#complex
z <- 4 + 2i
typeof(z)

#character
a <- "j"
typeof(a)

#logical
a1 <- T
typeof(a1)
a2 <- F
typeof(a2)


# Using variable

A <- 10
B <- 5
R <- A + B
R

var1 <-2.5
var2 <- 4

result <- var1 / var2
result

ans <- sqrt(var2)
ans

greeting <- "Hello"
name <- "Bob"
message <- paste(greeting, name)
message

# Logical Operators
# TRUE T
# FALSE F

res <- 4 < 5
res
typeof(res)
res2 <- !TRUE
res2
res | res2
res & res2
isTRUE(res)
10 > 100
4 == 5
4 != 3
