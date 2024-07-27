public class AccountTriggerSat24Handler {
    public static void closeAllOpps(List<Account> accNewRecords, Map<Id, Account> accOldRecords){
        // store the account Id
        system.debug(accNewRecords);
        Set<Id> accIds = new Set<Id>();
        if(accNewRecords!=null && !accNewRecords.isEmpty()){
            for(Account acc : accNewRecords){
                if(acc.Close_All_Opps__c == true && accOldRecords.containsKey(acc.id) && accOldRecords.get(acc.id).Close_All_Opps__c == false){
                   accIds.add(acc.id); 
                    system.debug(acc.id);
                }
            }
        }
        if(!accIds.isEmpty()){
            List<Opportunity> oppList = [select id, accountid, probability,stagename from opportunity 
                                         where accountId IN : accIds and stagename != 'closed won' and probability >= 70];
            List<Opportunity> oppToUpdate = new List<Opportunity>();
            if(!oppList.isEmpty()){
            for(Opportunity opp : oppList){
                opp.stagename = 'Closed Won';
                opp.closeDate= date.today();
                oppToUpdate.add(opp);
                system.debug(opp);
            }
        }
            if(!oppToUpdate.isEmpty()){
                update oppToUpdate;
            }
        }  
    }

}