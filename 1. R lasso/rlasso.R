library("glmnet")
x <- read.csv("design1.csv", header = FALSE, nrows=12)
x<-matrix(as.numeric(unlist(x)),nrow=12,ncol=20)

y <- read.csv("yresult.csv", header = FALSE)
total <- 0
for(t in 1:100)
{
    fit1 <- glmnet(x, t(y[t,]))
    beta1<-coef(fit1,s=0.01)
    if('1' %in% beta1@i)
        total <- total+1
}
