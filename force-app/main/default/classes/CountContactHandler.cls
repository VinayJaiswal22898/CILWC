public class CountContactHandler {
    public static void countContact(List<Contact> conNewRecords, Map<Id, Contact> conOldMapRecords){
        Set<Id> accIds = new Set<Id>();
        if(conNewRecords !=null && !conNewRecords.isEmpty()){  // insert or undelete 
            for(Contact con : conNewRecords){
                if(con.AccountId !=null){
                    accIds.add(con.AccountId);
                    system.debug(con.AccountId);
                }
            }
        }
            if(conNewRecords !=null && !conNewRecords.isEmpty() && conOldMapRecords !=null ){
                for(Contact con : conNewRecords){
                if(con.AccountId !=conOldMapRecords.get(con.id).accountId){
                    if(conOldMapRecords.get(con.id).accountId !=null){
                       accIds.add(conOldMapRecords.get(con.id).AccountId);  
                        system.debug(conOldMapRecords.get(con.id).AccountId);
                    }
                    if(con.AccountId !=null){
                        accIds.add(con.AccountId); 
                        system.debug(con.AccountId);
                    }
                } 
            }
        }
        if(conNewRecords !=null && conNewRecords.isEmpty()){  // for delete 
            for(Contact con : conNewRecords){
                if(con.AccountId !=null){
                    accIds.add(con.AccountId);
                    system.debug(con.AccountId);
                }
            }
        }
        if(!accIds.isEmpty()){
           Map<Id, Integer> mapOfCount = new Map<Id, Integer>();
            // List<Contact> conList = [Select accountID, Account.Number_Of_Contact__c From contact  where accountID In :accIds ]; 
           // List<Account> accList = [Select id,Number_Of_Contact__c, (select id from contacts) from Account where Id In  : accIds  ]; acc.Number_Of_Contact__c = acc.contacts.size() 
            for(AggregateResult ar : [select count(id) countOfContact, accountId 
                                      from contact
                                      where accountId IN : accIds group by accountId]){
                                          Id accid = (id)ar.get('accountId');
                                          system.debug(accid);
                                          Integer count = (Integer)ar.get('countOfContact');
                                          system.debug(count);
               mapOfCount.put(accid,count) ;
            }
            system.debug(mapOfCount);
             List<Account> accToUpdate = new List<Account>();
            if(!mapOfCount.isEmpty()){
                 for(Account acc: [select id,Number_Of_Contact__c from account 
                              where id In :mapOfCount.keyset()]){
                                  if(mapOfCount.containskey(acc.id)){
                                      acc.Number_Of_Contact__c = mapOfCount.get(acc.Id);
                                      accToUpdate.add(acc);
                                      system.debug(accToUpdate);
                                  }
                              } 
            }
           
            if(!accToUpdate.isEmpty()){
            update accToUpdate;
        }
        }
}
}