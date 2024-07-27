public class AccountTriggerHandler1 {
    public static void sendEmailAlert(List<Account> accRecords, Map<Id, Account> oldMap){
        Set<Id> ownerIds = new Set<Id>();
        for(Account accRecord : accRecords){
            if(accRecord.AnnualRevenue != null && accRecord.AnnualRevenue>50000 && accRecord.CreatedDate > Date.Today()-30
              && (oldmap!= null && oldmap.get(accRecord.id).annualRevenue != accRecord.annualRevenue)){
                ownerIds.add(accRecord.OwnerId);
            }
        }
        Map<Id, User> userMap = new Map<Id, User>();
        if(!ownerIds.isEmpty()){
            for(User u : [Select id, Name, Email from User where ID IN : ownerIds]){
                userMap.put(u.id, u);
                
                // or userMap = new map<Id, User> ([Select id, Name, Email from User where ID IN : ownerIds]);
            }   
        }
        List<Messaging.SingleEmailMessage> emailmessageList = New List<Messaging.SingleEmailMessage>();
        if(userMap.Size()>0){
            for(Account accRecord : accRecords){
                if(userMap.containsKey(accRecord.OwnerId)){
                    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                    email.setToAddresses(New String[]{userMap.get(accRecord.OwnerId).Email});
                    email.setSubject('Annual Revenue Exceed Alert ' + accRecord.Name);
                    email.setPlainTextBody('Dear ' + userMap.get(accRecord.OwnerId).Name + ',\n\n This is a Email Alert regarding your Annual ' 
                                           + ' Revenue Exceeded above 50k within month: ' +
                                           '\n RecordName= ' + accRecord.name + '\n RecordId=' + accRecord.Id);
                    emailmessageList.add(email);  
        }
            
        }
        }
        if(!emailmessageList.isEmpty()){
            Messaging.sendemail(emailmessageList);
        }
        
    }

}