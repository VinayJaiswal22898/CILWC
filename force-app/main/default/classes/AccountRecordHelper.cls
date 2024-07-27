public class AccountRecordHelper {
    
    // Assignment of procedure 
    // 2 . Insert an account record and a related contact record in the object
    public static void InsertAccountRecords(){
        Account acc = new Account();
            
            // Assigning the value
        acc.Name = 'Helo Ltd';
        acc.AccountNumber = '142145774';
        acc.AnnualRevenue = 2500005;
        acc.Industry = 'Finance';
        acc.Phone = '456987451235';
        acc.Fax = '457896541235';
        acc.BillingCity = 'Khalifa city';
        acc.BillingState = '12/5 Al ain road';
        acc.BillingStreet = 'Abu Dhabi';
        acc.BillingCountry = 'UAE';
        acc.Active__c = 'Yes';
        acc.Ownership = 'Public';
        acc.CustomerPriority__c = 'High';
        
        // insert the value
        Insert acc;
        
        If(acc!=null){
                System.debug('Account record inserted successfully' + acc.Id);
                
                // creating related contact record
                Contact con = new Contact();
                
                //Assigning the value
                con.FirstName = 'Ramu';
                con.LastName = 'Kuamr';
                con.Phone = '784512356';
                con.Fax = '45689742';
            	con.Email = 'ramu@gmail.com';
            	con.Title ='Manager';
            	con.MailingStreet  = '74 road';
            	con.MailingCity = 'Dubai city';
            	con.MailingState = 'Dubai';
            	con.MailingPostalCode = '225566';
            	con.MailingCountry = 'UAE';
            	con.AccountId = acc.Id;
            
            //insert contact 
              Insert con;
            if(con!= null){
                System.debug('Contact record inserted successfully. Id is ... '+con.Id);
            }
        }
        
        
    }

}