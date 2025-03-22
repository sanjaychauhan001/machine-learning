# question 1
mu<- 15.02
sigma<-0.06
spec_lower<-14.85
spec_upper<-15.15
#compute natural tolerance
NTL_lower<- mu-3*sigma
NTL_upper<- mu+3*sigma
NTL_lower
NTL_upper
if(spec_lower<=NTL_lower & spec_upper>=NTL_upper){
  cat("The specification limits are safe as they include all natural variations")
}else{
  cat("warning: The specification limits may reject some acceptable wings")
  }

# question 2
sample_size=4
A2<- 0.729
# simulated sample data
set.seed(123)
Xbar<- rnorm(25,mean=30,sd=1.5)
R<- runif(25,min = 2, max=6)
Rbar<- mean(R)
#cal traditional CL
xbar_mean<- mean(Xbar)
UCL_trad<- xbar_mean + A2*Rbar
LCL_trad<- xbar_mean - A2*Rbar
# apply modification factor (10 % wider)
mod_factor<- 1.15
UCL_mod<- xbar_mean + mod_factor*A2*Rbar
LCL_mod<- xbar_mean - mod_factor*A2*Rbar
# print result
cat("traditional control limits: [",round(UCL_trad,2),",",round(LCL_trad),"],\n")
cat("Modification Control Limits: [", round(UCL_mod, 2),",",round(LCL_mod,2),"],\n")

# question 3
weights <- c(198, 202, 199, 201, 203, 197, 200, 204, 196, 205, 198, 202)
sample_size<- length(weights)
# Calculate mean and standard deviation
Xbar_mean<- mean(weights)
sigma<- sd(weights)
# Traditional control limits (±3σ) 
UCL_trad<- Xbar_mean + 3*sigma
LCL_trad<- Xbar_mean - 3*sigma
# Modified control limits (10% wider)
mod_factor<- 1.1
UCL_mod <- Xbar_mean + mod_factor * 3 * sigma 
LCL_mod <- Xbar_mean - mod_factor * 3 * sigma 
# Print control limits 
cat("Tradiional limits: [",round(LCL_trad,2),",",round(UCL_trad,2),"]\n")
cat("Modified Limits: [", round(LCL_mod, 2), ",", round(UCL_mod, 2), "]\n")
# Plot control chart 
plot(weights,type="b",pch=16,col='blue',ylim = c(LCL_mod-5, UCL_mod + 5),
     main = "snack packet Control chart", xlab='sample number', ylab = 'packet weight')
# Add control limits 
abline(h=c(UCL_trad,LCL_trad), col="red",lty=2,lwd=2)
abline(h = c(UCL_mod, LCL_mod), col = "darkgreen", lty = 2, lwd = 2) # Modified Limits 
# Identify out-of-control points
out_of_control<- which(weights>UCL_mod | weights<LCL_mod)
points(out_of_control,weights[out_of_control], col='red',pch=19,cex=1.5)
# legend
legend("topright", legend = c("traditional_limits", "Modified Limits", "Out of Control"),
       col = c("red","darkgreen","red"),lty=c(2,2,NA), pch=c(NA,NA,19),lwd=2)


