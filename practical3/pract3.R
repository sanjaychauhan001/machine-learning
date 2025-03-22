# question 1
N<-1000
n<-150
c<-2
pap_values<- function(p){
  pap<- ppois(c,n*p)
  return(pap)
}
p_values<- c(0.005,0.03,0.05,0.1,0.2)
p<- c()
pap<- c()
AOQ<-c()
ATI<- c()
for(x in p_values){
  p<- rbind(p,x)
  pap<- rbind(pap,round(pap_values(x),4))
  AOQ<- rbind(AOQ, ((N-n)/N)*x*pap_values(x))
  ATI<- rbind(ATI, n*pap_values(x)+N*(1-pap_values(x)))
}
plot(p,pap,main="OC curve",type='b')
plot(p,AOQ,type='b')
plot(p,ATI,type='b')

# question 2
n<- 60
c<- 1
N<- 5000
p<- seq(0.01,0.1,by=0.01)
pa<- ppois(c,n*p)
AOQ<- (N-n/N)*p*pa
AOQL<- max(AOQ)
AOQL
plot(p,AOQ,type='b')
library(ggplot2)
ggplot(data.frame(p,AOQ), aes(x=p, y=AOQ))+
         geom_line(color='purple',size=1)+
         geom_point(color='red',size=2)+
         labs(title = 'AOQ curve', x='p',y='AOQ') + theme_minimal()
         


# question AOQL# question 3
#Producers risk = d = 1-Pa(Pt)
#Consumers risk = p = Pa(Pt)
calculate_risks<- function(n,c,p,pt){
  alpha<- 1-ppois(c,lambda = n*p)
  beta<- ppois(c, lambda = n*pt)
  return(list(alpha=alpha,beta=beta))
}
calculate_risks(20,1,0.005,0.1)
calculate_risks(100,3,0.01,0.2)
calculate_risks(40,2,0.03,0.15)

#question 4
N<-1200
n<-64
c<- 1
pap_values<- function(p){
  pap<- ppois(c,n*p)
  return(pap)
}
p_values<- c(0.005,0.008,0.01,0.02,0.04,0.10)
p<-c()
pap<-c()
AOQ<-c()
ATI<- c()
for(x in p_values){
  p<- rbind(p,x)
  pap<- rbind(pap,round(pap_values(x),4))
  AOQ<- rbind(AOQ,((N-n)/N)*x*pap_values(x))
  ATI<- rbind(ATI, n*pap_values(x)+(1-pap_values(x))*N)
}
plot(p,pap,type='b')
ggplot(data.frame(p,pap),aes(x=p,y=pap))+
  geom_line(color='purple',size=1)+
  geom_point(color='red',size=2) +
  labs(title="OC curve",x="p",y='pap') + theme_minimal()
ggplot(data.frame(p,AOQ),aes(x=p,y=AOQ))+
  geom_line(color='purple',size=1)+
  geom_point(color='red',size=2) +
  labs(title="OC curve",x="p",y='AOQ') + theme_minimal()
ggplot(data.frame(p,ATI),aes(x=p,y=ATI))+
  geom_line(color='purple',size=1)+
  geom_point(color='red',size=2) +
  labs(title="OC curve",x="p",y='ATI') + theme_minimal()

# question 5
n<-15
c<-1
p1<- 0.02
pa1<-pbinom(c,size=n,prob=p1)
alpha<- 1-pa1
p2<- 0.12
pa2<- pbinom(c,size=n,prob=p2)
beta<- pa2
cat("probability of acceptane at 2% defective",pa1)
cat("type 1 error (PR)",alpha)
cat("probability of aaceptance at 12% defective",pa2)
cat("Type 2 error consumer risk",beta) 
