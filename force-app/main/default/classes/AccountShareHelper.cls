public class AccountShareHelper {
    @InvocableMethod(Label =  ' Share Account Record TO User' Description = 'This Method is used to share account Record to required users')
    public static void shareAccountRecords(List<Account> accountRecordsToShare){
        if(!accountRecordsToShare.isEmpty()){
            List<AccountShare>  lstAcountToShare = new List<AccountShare>();
            for(Account accRecord : accountRecordsToShare){
                if(accRecord.Rating == 'Hot' && accRecord.Active__c == 'Yes' && accRecord.user__c != null){
                    AccountShare accShare = new AccountShare();
                    accShare.AccountId = accRecord.id;
                    accShare.UserOrGroupId = accRecord.User__c; 
                    accShare.RowCause = 'Manual';
                    if(accRecord.AnnualRevenue >= 5000000){
                        accShare.AccountAccessLevel = 'EDIT'; // read/write
                    } 
                    else
                        accShare.AccountAccessLevel = 'Read'; // readonly
                        
                   accShare.OpportunityAccessLevel = 'READ';
                   accShare.CaseAccessLevel = 'READ';
                   // add the record to collection 
                   lstAcountToShare.add(accShare) ;
                }
            }
            if(!lstAcountToShare.isEmpty()){
                Insert lstAcountToShare;
            }
        }
        
    }

}