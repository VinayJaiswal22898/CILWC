public class AccAfterUpdateTriggerHandler {
    public static void updateContactHomePhoneFild(List<Account> accNewRecords, Map<Id, Account> accOldMapRecords){
        Map<Id,Account> accMap = new Map<Id, Account>();
    List<Contact> conToUpdate = new List<Contact>();
    if(accNewRecords !=null && !accNewRecords.isEmpty()){
        for(Account acc  : accNewRecords){
            if(acc.Phone !=null && accOldMapRecords !=null && acc.phone !=accOldMapRecords.get(acc.id).phone){
                accMap.put(acc.id, acc);
            }
        }
    }
    if(!accMap.isEmpty()){
        List<Contact> conlist = [select homephone ,AccountId
                                 from contact
                                 where AccountId In : accMap.KeySet()];
        for(Contact con : conlist){
            if(accMap.Containskey(con.AccountId)){
                con.homePhone = accMap.Get(con.AccountId).phone; 
                conToUpdate.add(con);
            }
        }
    }
    if(!conToUpdate.isEmpty()){
        update conToUpdate;
    }
    }

}