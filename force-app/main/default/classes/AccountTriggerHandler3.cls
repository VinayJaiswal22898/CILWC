public class AccountTriggerHandler3 {
    public static void preventToDeleteActiveAccount(List<Account> accRecords){
        for(Account acc : accRecords){
            if(acc.Active__c=='Yes'){
                acc.addError('You are not authorized to delete active customer account');
            }
        }
    }

}