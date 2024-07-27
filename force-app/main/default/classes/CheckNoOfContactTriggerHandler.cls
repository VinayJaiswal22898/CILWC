public class CheckNoOfContactTriggerHandler {
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
            List<Account>lstAcc = [Select id,(select Id, AccountId From Contacts)
                               from Account
                               where Id In : accIds];
               
            for(Account acc : lstAcc){
                if(acc.contacts.size() >=5){
                    for(Contact con : newContacts){
                    con.addError('can not insert more than 5 contact on an account');
                    }
                }
            }
        }
    }    
}