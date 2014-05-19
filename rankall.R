rankall <- function(outcome, num = "best") {
      measureAll<-read.csv("outcome-of-care-measures.csv")
      ##stateWithNum<-as.data.frame(table(measureAll[,"State"]),)
      ##stateWithNum<-stateWithNum[order(stateWithNum[,1]),]
      ##stateWithNum
      ##class(stateWithNum[[1,2]])
      stateVectorFactor<-as.data.frame(table(measureAll[,"State"]))[,1]
      stateVector<-as.character(stateVectorFactor)
      stateVector<-sort(stateVector)
      ##stateVector
      outcome<-"heart attack"
      outcomeColumn<-0
      num=10
      if(outcome=="heart attack")
      {
            outcomeColumn<-11
            
      }else if(outcome=="heart failure")
      {
            outcomeColumn<-17
      }else if(outcome=="pneumonia")
      {
            outcomeColumn<-23
      }else
      {
            stop("invalid outcome")
      }
      i<-1
      hospitalVector<-NULL
      while(i<=length(stateVector))
      {
            
            measureState<-subset(measureAll,State==stateVector[i])
            if(num=="best"){
                  num=1
            }else if(num=="worst"){
                  num=sum(complete.cases(as.double(as.character(measureState[,outcomeColumn]))))
            }
            measureOrder<-measureState[order(as.double(as.character(measureState[,outcomeColumn])),measureState[,2]),]
            hospital<-as.character(measureOrder[num,2])
            hospital
            i<-i+1
      }


}
