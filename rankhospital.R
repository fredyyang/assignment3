rankhospital <- function(state, outcome, num="best"){
      measureAll<-read.csv("outcome-of-care-measures.csv")
      ##state<-"OR"
      ##outcome<-"heart attack"
      ##num<-"best"
      outcomeColumn<-0
      if(sum(complete.cases(match(measureAll[,"State"],state)))==0)
      {
            stop("invalid state")
      }
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
      
      measureState<-subset(measureAll,State==state)
      if(num=="best"){
            num=1
      }else if(num=="worst"){
            num=sum(complete.cases(as.double(as.character(measureState[,outcomeColumn]))))
      }      
      measureOrder<-measureState[order(as.double(as.character(measureState[,outcomeColumn])),measureState[,2]),]
      hospital<-as.character(measureOrder[num,2])
      hospital
      
}