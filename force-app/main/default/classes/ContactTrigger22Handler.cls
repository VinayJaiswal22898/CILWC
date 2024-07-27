public class ContactTrigger22Handler {
    public static void updateAccountRecord(List<Contact> cconNewRecords, Map<Id,Contact> conOldRecord){
        Map<Id, contact> mapOfContact = new Map<Id, contact>();
        if(!cconNewRecords.isEmpty()){
            for(Contact conRecord : cconNewRecords){
                if(conOldRecord.containsKey(conRecord.Id) && conRecord.description!=null && conOldRecord.get(conRecord.id).description != conRecord.description){ 
                   mapOfContact.put(conRecord.accountid, conRecord);  
                }
            }
        }
        if(!mapOfContact.isEmpty()){  // check null 
           Map<Id, Account> accMap = new Map<Id, Account>([Select id, description from account where Id In :mapOfContact.keyset()]);
           system.debug(mapOfContact.keyset());
            List<Account> accToUpdate = new List<Account>();  
            for(Contact con : cconNewRecords){
                Account acc = accmap.get(con.AccountId);
               acc.Description =con.Description;  
               accToUpdate.add(acc); 
                }
            if(!accToUpdate.isEmpty()){
                update accToUpdate;
            }
        }
        }
        
    }