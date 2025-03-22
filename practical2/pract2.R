# question 1
library(qcc)
data<-c(6,2,5,1,2,2,3,5,3,4,5,4,12,4,4,1,3,5,4,1,4,3,2,3) 
sample_size<-rep(50,length(data))
data1<- cbind(data,sample_size)
p_chart<- qcc(data, sizes = sample_size,type = "p")
# The process is mostly in control except for group 13, which needs investigation to identify potential 
# issues. The next step is to remove this point and create the p chart again to check for stability. 
summary(p_chart)
new_data1<-data.frame(data1[-13,])
p_chart<-qcc(new_data1$data,sizes=new_data1$sample_size,type="p")
#The process appears to be stable and in control, with no unusual variations in the defect proportion 
#across the groups. 

# question 2
defectives<-c(430,216,341,225,322,280,306,337,305,356,216,264,126,409,193,326,280,389,451,420)
sample_size<- rep(2000,length(defectives))
data2<-cbind(defectives,sample_size)
p_chart<-qcc(defectives,sizes=sample_size,type="p")
#The p chart shows ten points (Groups 1,2,4,11,13,14,15,18,19,20) beyond the control limits, 
#indicating potential issues. The next step is to remove these points and create the p chart again to 
#check for stability.
new_data2<-data.frame(data2[-c(1,2,4,11,13,14,15,18,19,20),])
p_chart<- qcc(new_data2$defectives,sizes = new_data2$sample_size,type = "p")
#The process appears to be stable and in control, with no unusual variations in the defect proportion 
#across the groups.

# question 3
defectives3<-c(1,3,3,1,6,4,3,7,10,2,6,4,3,2,7,1,5,6,4,2)
c_chart<- qcc(defectives3,type = 'c')
#The process appears to be stable and in control, with no unusual variations in the defect proportion 
#across the groups. 

# question 4
defectives4<-c(2,4,7,3,1,4,8,9,5,3,7,11,6,4,9,9,6,4,3,9,7,4,7,12) 
c_chart<-qcc(defectives4,type="c")
#The process appears to be stable and in control, with no unusual variations in the defect proportion 
#across the groups.

# question 5
defectives5<-c(7,12,3,20,21,5,4,3,10,8,0,9,6,7,20)
c_chart<-qcc(defectives5,type="c") 
#The p chart shows ten points (Groups 4 & 5) beyond the control limits, indicating potential issues. 
#The next step is to remove these points and create the p chart again to check for stability. 
new_df<-defectives5[-c(4,5,15)]
c_chart<-qcc(new_df,type='c')
#The process appears to be stable and in control, with no unusual variations in the defect proportion 
#across the groups. 

# question 6
?orangejuice
data("orangejuice")
orangejuice
attach(orangejuice)
sampledata<- orangejuice[1:30,]
qcc(sampledata$D,sizes = sampledata$size, type="p")
#The p chart shows ten points (Groups 15 & 24) beyond the control limits, indicating potential 
#issues. The next step is to remove these points and create the p chart again to check for stability.
new_data1<- data.frame(sampledata[-c(15,23,21),])
newdata<-orangejuice[31:54,]
qcc(new_data1$D,new_data1$size,type='p',newdata = newdata$D,newsizes = newdata$size)

# question 7
defective <- c(8, 10, 13, 9, 8, 10, 14, 6, 10, 13, 18, 15, 12, 14, 9)
sample_size<- 100
p_chart<- qcc(data=defective, type="p", sizes = rep(sample_size,length(defective)),
              title="fraction defective control chart")
