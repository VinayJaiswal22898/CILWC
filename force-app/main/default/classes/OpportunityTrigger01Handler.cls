public class OpportunityTrigger01Handler {
     public static void updateRecentAmountInAcc(List<Opportunity> newOppRecords){
        List<Account> accList = new List<Account>();
         system.debug(newOppRecords);
         Map<Id, Decimal> idVsDecMap = new Map<Id, Decimal>(); 
         List<Account> accountToBeUpdated = new List<Account>();
         if(newOppRecords !=null && !newOppRecords.isEmpty()){
            for(Opportunity oppRecord : newOppRecords){
                if( oppRecord.amount !=null && oppRecord.AccountId !=null ){
                     idVsDecMap.put(oppRecord.AccountId,oppRecord.Amount);  
                       system.debug(oppRecord.AccountId);
                }
            }
        }
         system.debug(idVsDecMap);
         if(!idVsDecMap.isEmpty()){
             for(Account acc : [Select id, recent_Opp_Amount__c from Account
                                where id In  : idVsDecMap.Keyset()]){
                      acc.recent_Opp_Amount__c =  (Decimal)idVsDecMap.get(acc.id);
                            accountToBeUpdated.add(acc);  
                                    system.debug(acc);
                                }
         }
         if(!accountToBeUpdated.isEmpty()){
             update accountToBeUpdated  ;
         }
    }
}