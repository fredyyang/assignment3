rankall <- function(outcome, num = "best") {
      ##num<-"worst"
      ##outcome<-"pneumonia"
      measureAll<-read.csv("outcome-of-care-measures.csv")
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
      
      i<-1
      hospitalVector<-NULL
      while(i<=length(stateVector))
      {
            
            measureState<-subset(measureAll,State==stateVector[i])
            if(num=="best"){
                  selectnum<-1
            }else if(num=="worst"){
                  selectnum<-sum(complete.cases(as.double(as.character(measureState[,outcomeColumn]))))
            }
            measureOrder<-measureState[order(as.double(as.character(measureState[,outcomeColumn])),measureState[,2]),]
            hospital<-as.character(measureOrder[selectnum,2])
            if(i==1){
            hospitalVector<-hospital
            }else{
                  hospitalVector<-c(hospitalVector,hospital)
            }
            i<-i+1
      }
      
      finalData<-data.frame(hospitalVector,stateVector)
      row.names(finalData)<-stateVector
      colnames(finalData)<-c("hospital","state")
      finalData      
}
