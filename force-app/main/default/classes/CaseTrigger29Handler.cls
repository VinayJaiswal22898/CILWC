public class CaseTrigger29Handler {
    public static void updateCaseNumberOnAccount(List<Case> newCaseRecords){
        List<Account> accToUpdate = new List<Account>();
        if(newCaseRecords !=null && !newCaseRecords.isEmpty()){
            for(Case c : newCaseRecords){
                if(c.accountId !=null){
                    Account acc = new Account();
                    acc.Latest_Case_Number__c = c.casenumber;
                    acc.id = c.accountId;
                    accToUpdate.add(acc);
                }
            }
        }
        if(!accToUpdate.isEmpty()){
            update accToUpdate;
        }
    }
}