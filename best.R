best <- function(state, outcome) {
      measureAll<-read.csv("outcome-of-care-measures.csv")
      ## Read outcome data
      ## Check that state and outcome are valid      
      state<-"OR"
      outcome<-"heart attack"
      outcomeColumn<-0
      ##stateVector<-measureAll[,"State"]
      if(sum(complete.cases(match(measureAll[,"State"],state)))==0)
      {
            stop("invalid state")
      }
      if(outcome=="heart attack")
      {
            outcomeColumn<-11
            
      }else if(outcome=="heart failure")
      {
            
      }else if(outcome=="pneumonia")
      {
            
      }else
      {
            stop("invalid outcome")
      }
      ## Return hospital name in that state with lowest 30-day death
      ## rate
      measureState<-subset(measureAll,State==state)
      head(measureState)
      measureSt<-measureState[order(outcomeColumn,2),]
      measureSt
      
      
      
}


best()