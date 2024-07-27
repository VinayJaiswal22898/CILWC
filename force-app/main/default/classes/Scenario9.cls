public class Scenario9 {
    public static void countContactRelatedAccount(List<Contact> conNew){
        List<Id> accIds = new List<Id>();
        if(conNew != null && !conNew.isEmpty()){
            for(Contact con : conNew){
                if(con.AccountId !=null){
                    accIds.add(con.AccountId);
                }
            }
        }
        if(!accIds.isEmpty()){
            List<Account> accToUpdate = new List<Account>();
          for(Account acc : [select id, name,(select id, accountId from contacts)
                            from Account
                             Where Id In : accIds]){
                                 acc.NumberOfEmployees__c = acc.contacts.size();
                                 accToUpdate.add(acc);
                             }
            if(!accToUpdate.isEmpty()){
                update accToUpdate;
            }
        }
    }
}