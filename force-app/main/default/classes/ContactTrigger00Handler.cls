public class ContactTrigger00Handler {
    public static void checkDuplicateEmail(List<Lead> leadNewRecords, Map<Id, Lead> leadOldMapRecord){
        Map<String, Contact> conMap = new Map<String, Contact>();
        List<Contact> conList = [Select id, email from contact];
        for(Contact con : conList){
            if(con.email !=null){
                conMap.put(con.Email, con);
            }
        }
        if(leadNewRecords !=null && !leadNewRecords.isEmpty()){
            for(Lead l : leadNewRecords){
                if(l.email !=null  || leadOldMapRecord !=null && l.email != leadOldMapRecord.get(l.id).email){
                    if(conMap.containsKey(l.Email)){
                        l.Email.addError('This email id is already exist in contact');
                    }
                }
            }
            
        }
    }

}