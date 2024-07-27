public class CountContactTriggerHandler {
    public static void countContact(List<Contact> conNewRecords, Map<Id, Contact> conOldMapRecords) {
       Set<Id> accIds = new Set<Id>(); // set to store parent account id 
        if(conNewRecords !=null && !conNewRecords.isEmpty()){
            for(Contact con: conNewRecords){ // for undelete and Insert
                if(con.AccountId!=null){
                    accIds.add(con.AccountId);
                }
            }
        }
        if(conNewRecords !=null && !conNewRecords.isEmpty() && conOldMapRecords!=null ){
            for(Contact con : conNewRecords){
                if(con.AccountId !=conOldMapRecords.get(con.Id).AccountId){
                    if(conOldMapRecords.get(con.Id).AccountId != null){
                       accIds.add(conOldMapRecords.get(con.Id).AccountId);
                    }
                    if(con.AccountId!=null){
                        accIds.add(con.AccountId);
                    }
                }
            }
        }
        if(conNewRecords!=null && !conNewRecords.isEmpty()){  // for delete 
            for(Contact con : conNewRecords){
                if(con.AccountId != null){
                    accIds.add(con.AccountId);
                }
            }
        }
        if(!accIds.isEmpty()){
             List<Account> accList = [Select id, number_of_Contact__c,(Select id from contacts) from Account
                                where Id IN : accIds];
            List<Account> accToUpdate = new List<Account>();
            If(!accList.isEmpty()){
        for(Account acc: accList){
            acc.number_of_Contact__c = acc.contacts.size();
            accToUpdate.add(acc);
        }
    }
            if(!accToUpdate.isEmpty()){
                update accToUpdate;
            }

        }
       
        }
    
    }