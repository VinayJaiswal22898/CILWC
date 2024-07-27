public class checkNoOfConBeforeInsertTriggerHandler {
    public static void checkNoOfConBeforeInsert(List<Contact> newContacts){
        Set<Id> accIds = new set<Id>();
        if(newContacts !=null && !newContacts.isEmpty()){
            for(Contact newContact : newContacts){
                if(newContact.accountId !=null){
                    accIds.add(newContact.AccountId);
                }
            }
        }
        if(!accIds.isEmpty()){
          
            Map<Id, Integer> accIdToContactCount = new Map<Id, Integer>();
            for(AggregateResult result : [Select count(Id) contactCount, accountId
                                         from contact
                                         Where accountId In : accIds
                                          Group by accountId]){
                                              accIdToContactCount.put((Id)result.get('AccountId'), (Integer)result.get('contactCount'));
                                          }
           
           
           if(!accIdToContactCount.isEmpty()){
                for(Contact newContact : newContacts){
                    if(accIdToContactCount.containsKey(newContact.AccountId) && accIdToContactCount.get(newContact.AccountId)>=5){
                        newContact.addError('You can not insert more 5 contact on an account');
                    }
                }
            }
        }
    }    
}