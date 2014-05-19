rankall <- function(outcome, num = "best") {
      source("rankhospital.R")
      measureAll<-read.csv("outcome-of-care-measures.csv")
      stateWithNum<-as.data.frame(table(measureAll[,"State"]),)
      stateVectorFactor<-as.data.frame(table(measureAll[,"State"]))[,1]
      stateVector<-as.character(stateVectorFactor)
      stateVector<-sort(stateVector)
      outcomeColumn<-0
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
      
      
      lapply(stateVector,print)


}
