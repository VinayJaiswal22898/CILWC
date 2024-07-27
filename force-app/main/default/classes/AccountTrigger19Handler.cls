public class AccountTrigger19Handler {
    public static void updateOpp(List<Account> newRecords){
        Set<Id> accIds = new Set<Id>();
        if(newRecords!=null && !newRecords.isEmpty()){
            for(Account acc : newRecords){
              accIds.add(acc.id);  
            }
        }
        if(!accIds.isEmpty()){
            Date day30 = date.Today()-30;
            List<Opportunity> oppToUpdate = New List<opportunity>();
            List<Opportunity> oppList = [Select id,AccountId, test_created_date__c, StageName  from opportunity 
                                        where AccountId IN :accIds];
            if(!oppList.isEmpty()){
                for(opportunity opp :oppList){
                    if(opp.test_created_date__c<day30 && opp.StageName != 'Closed Won'){
                        opp.closeDate = date.today();
                        opp.StageName  = 'Closed Lost';
                        oppToUpdate.add(opp);
                    }
                    
                }
            }
            if(!oppToUpdate.isEmpty()){
                update oppToUpdate;
            }
        }
    }

}