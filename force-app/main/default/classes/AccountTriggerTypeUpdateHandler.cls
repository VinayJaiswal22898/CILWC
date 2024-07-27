public class AccountTriggerTypeUpdateHandler {
    public static void AccountTypeUpdate(List<Account> accNewRecords, Map<Id, Account>accOldMapRecords ) {
        Set<Id> accIds = new Set<Id>();
        if (accNewRecords != null && !accNewRecords.isEmpty()) {
            for (Account acc : accNewRecords) {
                if (accOldMapRecords != null && 
                    accOldMapRecords.containsKey(acc.Id) && 
                    acc.Type != accOldMapRecords.get(acc.Id).Type) {
                    accIds.add(acc.Id);
                }
            }
        }
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        if (!accIds.isEmpty()) {
            List<Contact> conList = [SELECT Id, AccountId, Email, LastName FROM Contact WHERE AccountId IN :accIds];
            if (!conList.isEmpty()) {
                for (Contact con : conList) {
                    if (con.Email != null) {
                        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                        email.setTargetObjectId(con.Id);
                        email.setSenderDisplayName('System Admin');
                        email.setSubject('Account Type Update');
                        String body = 'Dear ' + con.LastName + ',<br/>';
                        body += 'Your account type has been updated';
                        email.setHtmlBody(body);
                        email.setToAddresses(new String[]{con.Email});
                        emailList.add(email);
                    }
                }
            }
        }
        if (!emailList.isEmpty()) {
            Messaging.sendEmail(emailList);
        }
    }
}