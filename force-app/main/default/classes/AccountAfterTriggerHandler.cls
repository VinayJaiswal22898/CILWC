public class AccountAfterTriggerHandler {
    public static void updateContactHomeField(List<Account> accNewRecords, Map<Id, Account> accOldMapRecords){
        List<Contact> conToUpdate = new List<Contact>();
        Map<Id, Account> accMap = new Map <Id, Account>();
        if(accNewRecords !=null && !accNewRecords.isEmpty()){
            for(Account accNewRecord : accNewRecords){
                if((accNewRecord.phone !=null && accNewRecord.phone != '') && (accOldMapRecords !=null && accNewRecord.phone !=accOldMapRecords.get(accNewRecord.id).phone)){
                    accMap.put(accNewRecord.id, accNewRecord);
                }
            }
        }
        if(!accMap.isEmpty()){
                    for(Contact con :[Select homephone,accountId from contact where accountId In : accMap.keyset()]){
                        if(accMap.containsKey(con.AccountId)){    
                        con.HomePhone = accMap.get(con.accountid).Phone;
                        conToUpdate.add(con);       
            }
        if(!conToUpdate.isEmpty()){
            update conToUpdate;
        }
    }
}
    }
}