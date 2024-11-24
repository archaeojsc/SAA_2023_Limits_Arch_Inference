M<-c(100,82,74,69,62,55,53,51,45,42,38,38,36,34,34,34,33,33,32,32,31,30,29,28,25,23,22,22,22,22,21,20,20,20,20,20,18,14,14,12,12,12,10,10,10,10,10,8,6,6,1,1,1,1,1) # from Justeson (1973)

M<-c(M,rep(1,808)) # make L[1] = 2,317

codes <- c(1:100)

code_fq <-rep(1,100)

for(i in 2:length(M)) {
  code_fq <- c(code_fq[1:(length(code_fq) - M[i])], code_fq[((length(code_fq) - M[i]) + 1):100] + 1)
}

L <- c()
for (t in 1:length(M)) {
  L[t] <- sum(M[t:length(M)])
}

plot(1:length(M),M, type="o", log="y", xlim=c(0,70))
plot(1:length(L),L, type="o", log="y", xlim=c(0,70))

(L[1]^2 / (L[1]-M[1]))-L[1]

r<- rank(-code_fq, ties.method = "random")

