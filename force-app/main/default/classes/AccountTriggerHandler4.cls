public class AccountTriggerHandler4 {
    public static void preventContactDeletion(Map<Id, Account> oldMap){
        // fetch the related contact records from account
        List<Contact> conRecord = [Select id, firstName, lastName
                                  from contact
                                  where accountId IN : oldMap.keyset()];
        if(!conRecord.isEmpty()){
            for(Contact con : conRecord)
            con.accountId = null;
        }
        update conRecord;
    }

}