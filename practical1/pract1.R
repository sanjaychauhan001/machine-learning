install.packages('qcc')
# question no1
library(qcc)
data(package='qcc')
data("pistonrings")
head(pistonrings)
pistonrings 
attach(pistonrings)
diameter
piston<- qcc.groups(diameter,sample)
qcc(piston[1:25,],type="xbar")
qcc(piston[1:25,],type="R")
qcc(piston[1:25,],type="S")

# question no2
piston
qcc(piston[1:25,],type="R",newdata = piston[26:40,])
qcc(piston[1:25,],type="xbar",newdata = piston[26:40,])##Assignable cost in the points not in control 
qcc(piston[1:25,],type="S",newdata = piston[26:40,]) 

## question 3
data<- read.csv(file.choose())
data
qc3<-qcc.groups(data$obs,data$sample)
qc3
qcc(qc3,type = 'xbar')
#The x-bar chart shows two points (Groups 8 and 10) beyond the control limits, indicating potential 
# issues. The next step is to remove these points and create the x-bar chart again to check for 
#stability. 
qcc(qc3[-c(8,10),],type="xbar",title='new_xbar')
qcc(qc3,type="R")
qcc(qc3,type="S")

# question 4
data <- read.csv(file.choose())
data
qcc(data,type='xbar')
qcc(data,type = 'R')
qcc(data,type = 'S')

# question 5
data<- read.csv(file.choose())
data
mean_xbar<- mean(data$mean)
mean_r<- mean(data$range)
#control limits for x bar chart
a2<- 0.58
ucl_xbar<- mean_xbar + a2*mean_r
lcl_xbar<- mean_xbar - a2*mean_r
cl_xbar<- mean_xbar
#control limits for r chart
d3<- 0
d4<- 2.114
ucl_r<- mean_r*d4
lcl_r<- mean_r*d3
cl_r<- mean_r
mean_s<- mean(data$range)
#control limits for schar
b3<- 0.0
b4<- 2.089
ucl_s<- mean_s*b4
lcl_s<- mean_s*b3
cl_s<- mean_s
plot(data$group,data$mean,type = 'b',pch=16, col='blue',
     ylim = c(min(lcl_xbar, min(data$mean)), max(ucl_xbar, max(data$mean))),
     xlab="sample_number", ylab="sample_mean", main='xbar chart')
abline(h=ucl_xbar, col="red", lty=2)
abline(h=lcl_xbar, col="red", lty=2)
abline(h=cl_xbar, col="green", lty=2)
#The x-bar chart shows two points (Groups 15 and 17) beyond the control limits, indicating potential 
#issues. The next step is to remove these points and create the x-bar chart again to check for 
#stability. 
# New x_bar chart
new_data<-data[-c(15,17)]
mean_xbar<- mean(new_data$mean)
mean_r<- mean(new_data$range)
a2<- 0.58
ucl_xbar<- mean_xbar + a2*mean_r
lcl_xbar<- mean_xbar - a2*mean_r
cl_xbar<- mean_xbar
plot(new_data$group,new_data$mean,type = 'b',pch=16, col='blue',
     ylim = c(min(lcl_xbar, min(new_data$mean)), max(ucl_xbar, max(new_data$mean))),
     xlab="sample_number", ylab="sample_mean", main='xbar chart')
abline(h=ucl_xbar, col="red", lty=2)
abline(h=lcl_xbar, col="red", lty=2)
abline(h=cl_xbar, col="green", lty=2)

# question 6
sample_no<- 1:10
mean_values <- c(43, 49, 37, 44, 45, 37, 51, 46, 43, 47)
range_values <- c(5, 6, 5, 7, 7, 4, 8, 6, 4, 6)
sample_size <- 6
# Mean of sample means and range
mean_xbar<- mean(mean_values)
mean_r<- mean(range_values)
# Constants for n = 6
a2<- 0.48  
d3<- 0.076
d4<- 1.924
b3<- 0
b4<- 2.089
# Control limitsfor X-bar char
ucl_xbar<- mean_xbar + a2* mean_r
lcl_xbar<- mean_xbar - a2* mean_r
cl_xbar<- mean_xbar
# Control limits for R char
ucl_r<- mean_r * d4
lcl_r<- mean_r * d3
cl_r<- mean_r
# Control limits for S char
ucl_s<- mean_s * b4
lcl_s<- mean_s * b3
cl_s<- mean_s
plot(sample_no, mean_values, type = "b", pch = 16, col = "blue",
      ylim = c(min(lcl_xbar, min(mean_values)), max(ucl_xbar, max(mean_values))),
      xlab = "Sample Number", ylab = "Sample Mean", main = "X-Bar Chart")

abline(h = ucl_xbar, col = "red", lty = 2)
abline(h = lcl_xbar, col = "red", lty = 2)
abline(h = cl_xbar, col = "green", lty = 2)
#The x-bar chart shows four points 2,3,6,7 beyond the control limits, indicating potential issues. The 
#next step is to remove these points and create the x-bar chart again to check for stability. 
# Plot New X_bar Chart 
# Remove samples 2, 3, 6, and 7 
cleaned_data <- data6[-c(2, 3, 6, 7), ] 

