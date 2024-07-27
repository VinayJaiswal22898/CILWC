public  class OpoortunityTriggerHandler {
    public static void  maxOpportunity(List<Opportunity> newOppRecords, Map<Id, Opportunity> oldMapRecords) {
          Set<Id> accIds = new Set<Id> (); // store parent id of opportunity 
          if(newOppRecords!=null && !newOppRecords.isEmpty()){
            for(Opportunity oppRecord : newOppRecords){
                if(oldMapRecords!=null){
                    Opportunity oppOld  = oldMapRecords.get(oppRecord.id);
                    if(oppRecord.AccountId != oppOld.AccountId){
                        accIds.add(oppRecord.AccountId);
                        accIds.add(oppOld.AccountId);
                    }
                    else{
                        accIds.add(oppRecord.AccountId);
                    }
                }
                else if (oppRecord.AccountId!=null ){ 
                    accIds.add(oppRecord.AccountId);
                }  
            }
          }
          if(!accIds.isEmpty()){
            List<Account> accList = [Select id,  oppMax__c,  (Select id, accountId, name, amount from opportunities where  Amount !=null order by amount Desc limit 1  ) 
            from account  where Id In :accIds];  
            List<Account> accToUpdate= New List<Account>();
   if(!accList.isEmpty()){
    for(Account acc: accList){
        if(!acc.opportunities.isEmpty()){
            acc.oppMax__c = acc.opportunities[0].name;
            accToUpdate.add(acc);
        }
        else {
            acc.oppMax__c = '';
            accToUpdate.add(acc);
        }
    }
   }
   if(!accToUpdate.isEmpty()){
    update accToUpdate;
   }
          }
    }
}