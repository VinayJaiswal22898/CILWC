public class UpdateAccountOppAmount {
    public static void updateAccountRecord(List<Opportunity> oppNewRecords, Map<Id,Opportunity> oldMapOppportunity){
        Set<Id> accIds = new Set<Id>();
        if(oppNewRecords !=null && !oppNewRecords.isEmpty()){ // insert or update
            for(Opportunity opp : oppNewRecords){
                if((opp.AccountId !=null  &&  opp.Amount !=null) 
                   || (oldMapOppportunity !=null && opp.Amount == oldMapOppportunity.get(opp.Id).Amount)){
                     accIds.add(opp.AccountId);
                }
            }
            for(Opportunity opp :oppNewRecords){ // delete
                if(opp.AccountId !=null){
                    accIds.add(opp.AccountId);
                }
            }
        }
        if(!accIds.isEmpty()){
            Map<Id,Decimal> oppSumAmount = new Map<Id, Decimal>();
            for(AggregateResult aggr : [Select sum(Amount) SumAmount, AccountId
                                          from Opportunity
                                          Where AccountId IN :accIds 
                                          Group by AccountId]){
                                         oppSumAmount.put((Id)aggr.get('AccountId'),(Decimal)aggr.get('SumAmount')) ;  
                                        }
            List<Account> accToUpdate = new List<Account>();
            for(Account acc : [Select id, name, Sum_of_Opps__c 
                              from Account 
                               Where Id IN: accIds]){
                                   if(oppSumAmount.containskey(acc.id)){
                                      acc.sumofOppAmount__c = oppSumAmount.get(acc.Id);
                                       system.debug(acc.sumofOppAmount__c);
                         accToUpdate.add(acc);     
                                   }
            if(!accToUpdate.isEmpty()){
                update accToUpdate;
            }
        }
    }
}
}