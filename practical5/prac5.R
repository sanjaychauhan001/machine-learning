# question no1
n1<- 8
n2<- 12
c1<-1
c2<- 4
p<- 0.07
N<- 100
lot<- rbinom(N,1,p)
sample1<- sample(lot,n1)
def1<- sum(sample1)
if(def1 <=c1){
  decision<- "Accept lot after first sample"
}else if(def1 > c1 & def1<= c2){
  sample2<- sample(setdiff(lot,sample1),n2)
  def2<- sum(sample2)
  total_def<- def1 + def2
  decision<- ifelse(total_def <=c2, "Accept lot(after second sample","reject lot")
}else{
  decision<- "reject lot"
}
print(decision)

# question 2
n1<- 12
n2<- 18
c1<- 2
c2<- 6
N<- 120
p<- 0.08
lot<- rbinom(N,1,p)
sample1<- sample(lot,n1)
def1<- sum(sample1)
if(def1<=c1){
  decision<- "accept the lot(after firtst sample"
}else if(def1 > c1 & def1<=c2){
  sample2<- sample(setdiff(lot,sample1),n2)
  def2<- sum(sample2)
  total_def<- def1+def2
  decision<- ifelse(total_def<- c2, "Accept the lot (after sencond sample)", "reject lot")

}else{
  decision<- "reject lot"
}
print(decision)

# question 3
n1<- 10
n2<- 15
c1<- 1
c2<- 4
N<- 50
sample1<- c(0, 1, 0, 0, 1, 0, 1, 1, 0, 0)
def1<- sum(sample1)
def1
if(def1<=c1){
  decision<- "Accept Lot (after first sample)"
}else if(def1>c1 & def1<=c2){
  sample2<- c(1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0) 
  def2<- sum(sample2)
  total_def<- def1 + def2
  decision<- ifelse(total_def<=c2, "Accept Lot after second sample","Reject Lot")
}else{
  decison<- "reject Lot"
}
print(decision)
