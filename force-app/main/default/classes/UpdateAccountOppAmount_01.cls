public class UpdateAccountOppAmount_01 {
    public static void updateAccountRecord(List<Opportunity> oppNewRecords, Map<Id,Opportunity> oldMapOppportunity){
        Set<Id> accIds = new Set<Id>();
        if(oppNewRecords !=null && !oppNewRecords.isEmpty()){ // insert or update
            for(Opportunity opp : oppNewRecords){
                if((opp.AccountId !=null  &&  opp.Amount !=null) 
                   || (oldMapOppportunity !=null && opp.Amount != oldMapOppportunity.get(opp.Id).Amount)){
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
            List<Account> lstAcc = [Select id , name, sumofOppAmount__c, (Select id , amount from Opportunities) 
                                                                from Account
                                                                Where Id In : accIds];
            List<Account> accToUpdate = new List<Account>();
            for(Account acc : lstAcc){
                                      acc.sumofOppAmount__c = acc.Opportunities.size();
                         accToUpdate.add(acc);     
                                   }
            if(!accToUpdate.isEmpty()){
                update accToUpdate;
            }
        }
    }
}