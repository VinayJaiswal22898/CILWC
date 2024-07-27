public class AccountTrigger11Handler {
    public static void updateContactRecord(List<Account> accRecords , Map<Id, Account> oldMap){
        Map<Id, Account> accMap = new Map<Id, Account>();
        if(!accRecords.isEmpty()){
        for(Account acc : accRecords){
            if(oldMap.get(acc.id).phone !=acc.phone){
              accMap.put(acc.id,acc);  
            }
        }
        }
        List<Contact> conList = [Select id,accountId, Phone from contact
                                where accountId IN : accMap.keySet()];
        List<Contact> conToUpdate = new List<Contact>();
        if(!conList.isEmpty()){
            for(Contact con :conList){
                con.phone = accMap.get(con.AccountId).phone;
                conToUpdate.add(con);
            }
        }
        if(!conToUpdate.isEmpty()){
            update conToUpdate;
        }

    }

}