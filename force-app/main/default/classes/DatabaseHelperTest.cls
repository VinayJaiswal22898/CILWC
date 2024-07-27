@isTest()
public class DatabaseHelperTest {
    public testmethod static void testDatabaseOperation(){
        DatabaseHelper.getAccountCountRecords('Account');
        //DatabaseHelper.getPositionBySearchText('Test');
        
    
        insertBulkAccount(); 
        DatabaseHelper.getAccountBySearchText('TCS ');
        
//        DatabaseHelper.getPositionBySearchText('Rohit');
  
         
    }
    
        // write the code to insert the account record
    public static void insertBulkAccount(){
            List<Account> lstAccount = new List<Account>();
            for(Integer counter = 1 ; counter<=20; counter ++){
                Account acc = new Account();
                acc.AccountNumber = 'fh4500989';
                acc.Name = 'TCS Lab' + counter;
                acc.Active__c = 'yes';
                acc.AnnualRevenue = 1200000;
                acc.AccountSource = 'web';
               // add to list
               lstAccount.add(acc);
                    }
        if(!lstAccount.isEmpty()){
            Insert lstAccount;
        }
        }

}