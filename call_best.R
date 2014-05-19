source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript3.R")
source(best.R)
submit()
yangzhihao4023@gmail.com
vuyEvdbXaa
4


1
2
submit()
7



source("best.R")
best("TX", "heart attack")
[1] "CYPRESS FAIRBANKS MEDICAL CENTER"

best("TX", "heart failure")
[1] "FORT DUNCAN MEDICAL CENTER"

best("MD", "heart attack")
[1] "JOHNS HOPKINS HOSPITAL, THE"

best("MD", "pneumonia")
[1] "GREATER BALTIMORE MEDICAL CENTER"

best("BB", "heart attack")

Error in best("BB", "heart attack") : invalid state

best("NY", "hert attack")
Error in best("NY", "hert attack") : invalid outcome


source("rankhospital.R")
rankhospital("TX", "heart failure", 4)
[1] "DETAR HOSPITAL NAVARRO"
rankhospital("MD", "heart attack", "worst")
[1] "HARFORD MEMORIAL HOSPITAL"
rankhospital("MN", "heart attack", 5000)
[1] NA