best <- function(state, outcome) {
      measureAll<-read.csv("outcome-of-care-measures.csv")
      ##Read outcome data
      ##Check that state and outcome are valid      
      ##state<-"OR"
      ##outcome<-"heart attack"
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
      ## Return hospital name in that state with lowest 30-day death
      ## rate
      measureState<-subset(measureAll,State==state)
      measureOrder<-measureState[order(as.double(as.character(measureState[,outcomeColumn])),measureState[,2]),]
      hospital<-as.character(measureOrder[1,2])
      hospital
}
