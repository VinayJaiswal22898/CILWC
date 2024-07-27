public class ContacttriggerEmailValHandler {
    public static void preventDuplicateEmail(List<Contact> newContact, Map<Id,Contact> conOldMap){
        //Set<Id> accIds = new Set<Id>();
        //set<String> newEmail = new set<string>();
       Map<Id,String> newEmailMap = new Map<Id,String>();
        if(newContact!=null && !newContact.isEmpty()){
            for(Contact con : newContact){
                if(con.email!=null && con.AccountId !=null || 
                   (conOldMap !=null && con.AccountId != conOldMap.get(con.id).accountId)){ 
                    //accIds.add(con.accountId);
                    //newEmail.add(con.Email); 
                    newEmailMap.put(con.AccountId,con.Email);
                    } 
            }
        }
        if(newEmailMap!=null && !newEmailMap.isEmpty()){
        Set<String> existingEmailSet = new Set<String>();
            for(contact con : [Select id, email from contact where Email IN : newEmailMap.values() and accountid In : newEmailMap.keyset()]){
                if(con.email!=null){
                    existingEmailSet.add(con.Email);
                }
            }
               if(existingEmailSet!= null && !existingEmailSet.isEmpty()){
               for(contact con : newContact){  
                   if(con.email != null && existingEmailSet.contains(con.Email)){
                   con.addError('Duplicate Email');
            }
        }
    }
        }
    }
}