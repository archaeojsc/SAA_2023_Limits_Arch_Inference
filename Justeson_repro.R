M <- c(
  100,82,74,69,62,55,53,51,45,42,38,38,36,34,34,34,33,33,
  32,32,31,30,29,28,25,23,22,22,22,22,21,20,20,20,20,20,
  18,14,14,12,12,12,10,10,10,10,10,8,6,6,1,1,1,1,1
  ) # from Justeson (1973)

M <- c(M, rep(1, 808)) # make L[1] = 2,317

codes <- c(1:(max(M)))

# Extract frequency of codes from M
code_fq <- rep(1, length(codes))

for (i in 2:length(M)) {
  code_fq <- c(
    code_fq[1:(length(code_fq) - M[i])], 
    code_fq[((length(code_fq) - M[i]) + 1):length(code_fq)] + 1
    )
}

# Feature scaling p(r)
alpha <- 0.001
code_fq_scaled <- (code_fq - min(code_fq)) / (max(code_fq) - min(code_fq)) + alpha

# Extract N from code frequencies

N <- c()

for(i in 1:length(M)) {
  N[i] <- length(code_fq[code_fq == i])
}

# Get t

t <- c(1:M[1])

# Calculate L

L <- c()

for (i in 1:length(M)) {
  L[i] <- sum(M[i:length(M)])
}

plot(t[1:55],
     M[1:55],
     type = "o",
     log = "y",
     xlim = c(0, 55),
     ylim = c(1, 200),
     xlab = "t",
     ylab = "M")

plot(t,
     L,
     type = "o",
     log = "y",
     xlim = c(0, 70),
     ylim = c(500,3000))

(L[1] ^ 2 / (L[1] - M[1])) - L[1]


# r <- rank(-code_fq_scaled, ties.method = "max")
r <- rank(-code_fq_scaled, ties.method = "average")
# r <- rank(-code_fq_scaled, ties.method = "min")

rlm <- lm(c(0, code_fq_scaled[1:99]) ~ poly(c(123, r[1:99]), 2, raw = TRUE))
rlm3 <- lm(c(0, code_fq_scaled[1:99]) ~ poly(c(123, r[1:99]), 3, raw = TRUE))
rlm4 <- lm(c(0, code_fq_scaled[1:99]) ~ poly(c(123, r[1:99]), 4, raw = TRUE))



wt <- 1 / lm(abs(rlm$residuals) ~ rlm$fitted.values)$fitted.values ^ 2

rlm_wt <- lm(c(0, code_fq_scaled[1:99]) ~ poly(c(123, r[1:99]), 2, raw = TRUE), weights = wt)


plot(c(0, code_fq_scaled[1:99]),
     c(123, r[1:99]),
     log = "y",
     # xlim = c(0,0.1),
     ylim = c(1,150),
     xlab = "p(r)",
     ylab = "r",
     type = "o")


