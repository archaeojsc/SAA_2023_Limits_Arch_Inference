library(tidyverse)
library(ggplot2)
library(caret)

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
  code_fq <- c(code_fq[1:(length(code_fq) - M[i])], code_fq[((length(code_fq) - M[i]) + 1):length(code_fq)] + 1)
}

# Zipf models
library(zipfR)

joint_site.tfl <- zipfR::tfl(f = code_fq) # term frequency list
joint_site.spc <- tfl2spc(joint_site.tfl) # frequency spectra

# Enable parallel threads

library(parallel)

cl <- makeCluster(4)

#  Large-Number-of-Rare-Event (LNRE) model
joint_site.fzm <- lnre(
  type = "fzm",
  # type = "zm",
  # type = "gigp",
  spc = joint_site.spc,
  m.max = 50,
  # cost = "exact",
  cost = "linear",
  # cost = "smooth.linear",
  # cost = "gof",
  exact = TRUE,
  bootstrap = 100,
  # parallel = cl, # if on Windows
  parallel = 4, # if on linux
  # method = "SANN"
  # method = "NLM"
  # method = "BFGS"
  method = "Nelder-Mead"
)

summary(joint_site.fzm)

joint_site.fzm.spc <- lnre.spc(joint_site.fzm)

plot(joint_site.spc,
     joint_site.fzm.spc,
     m.max = 25,
     bw = TRUE)

plot(
  joint_site.tfl,
  joint_site.fzm,
  log = "xy",
  type = "s",
  freq = FALSE,
  ylab = "Relative Frequency",
  bw = TRUE,
  grid = TRUE,
  legend = c("Observed", "Expected (fZM)")
)

# Feature scaling p(r)
alpha <- 0.001
code_fq_norm <- (code_fq - min(code_fq)) / (max(code_fq) - min(code_fq)) #+ alpha

# Extract N from code frequencies

N <- c()

for(i in 1:length(M)) {
  N[i] <- length(code_fq[code_fq == i])
}

# Get t

t <- c(1:length(M))

# Calculate L

L <- c()

for (i in 1:length(M)) {
  L[i] <- sum(M[i:length(M)])
}

plot(
  t[1:55],
  M[1:55],
  type = "o",
  log = "y",
  xlim = c(0, 55),
  ylim = c(1, 200),
  xlab = "t",
  ylab = "M"
)

plot(
  t,
  L,
  type = "o",
  log = "y",
  xlim = c(0, 70),
  ylim = c(500, 3000)
)

(L[1] ^ 2 / (L[1] - M[1])) - L[1]


# Frequency rank, from highest to lowest

# r <- rank(-code_fq_scaled, ties.method = "max")
# r <- rank(-code_fq_scaled, ties.method = "average")
r <- rank(-code_fq, ties.method = "random")
r_min <- rank(-code_fq, ties.method = "min")

rank_freq <- data.frame(code = codes[1:99],
                        frequency = code_fq[1:99],
                        rank = r[1:99])

rlm2 <- lm(frequency ~ poly(rank, 2, raw = TRUE), data = rank_freq)
rlm3 <- lm(frequency ~ poly(rank, 3, raw = TRUE), data = rank_freq)
rlm4 <- lm(frequency ~ poly(rank, 4, raw = TRUE), data = rank_freq)


plot(c(0, code_fq[1:99]),
     c(123, r_min[1:99]),
     log = "y",
     # xlim = c(0,0.1),
     ylim = c(1,150),
     xlab = "p(r)",
     ylab = "r",
     type = "s")


