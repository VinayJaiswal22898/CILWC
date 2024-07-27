public class DMLHelper {
 	//-------Database class insert
    Public static void insertLeadRecords(){
       List<Lead> lstLead = new List<Lead>();
        
        for(Integer Counter =1; Counter <= 5; Counter++ ){
         Lead objLead = new lead();
            objLead.lastName = 'Kumar' + counter;
            objLead.Industry = 'Banking';
            if(Counter != 4){
               objLead.Company = ' TCS ltd';  
            }
            objLead.Phone= '67543245678';
            lstLead.add(objLead);
        }
        Database.SaveResult [] results = Database.Insert(lstLead, false);
        for(Database.SaveResult result : results){
            if(result.isSuccess()){
                System.debug('Record Inserted Successfully. Record Id is ..' + result.getId());
                
            }
            else // fail record 
                {
                    Database.error[] errorRecords = result.getErrors(); // getError method will return multiple value so we can store it in aarry or list
                    for(Database.error error :errorRecords ){
                        System.debug('Error Message is ..'+ error.getMessage());
                        System.debug('Error status code is ..'+ error.getStatusCode());
                        System.debug('Affected Field ..'+ error.getFields());
                    }
            } 
            System.debug ('......................');
        }
        
    } 
    // ----merge record 
    // in merge record one shlould store only single record type of varibal like Account acc = [SOQL]
    public static void mergeAccountRecords() {
    Account accMerge1 = [SELECT Id, Name
                               FROM Account
                               WHERE Name = 'Data Loader 3'
                               LIMIT 1];
    List<Account> accMerge2 = [SELECT Id, Name
                               FROM Account
                               WHERE Name = 'Apples & Oranges'
                               LIMIT 1];
   List<Account> accMerge3 = [SELECT Id, Name
                               FROM Account
                               WHERE Name = 'Upsert Data'
                             LIMIT 1]; 
        // store the two list in signle list and pass the list ot merge statement
        List<Account> store = New List<Account> ();
        store.addAll(accMerge2);
        store.addAll(accMerge3);

    if (accMerge1 !=null && accMerge2 !=null) {
        
     
        //Merge  accMerge1 store; // with multiple recrd meerge
        
        // with database merge 
        Database.MergeResult[] results = Database.merge(accMerge1, store, false);
        for(Database.MergeResult result : results){
        if(result.isSuccess()){
            
           System.debug('Record Successfully. mergered ID is....'+ result.getId());
        }
        else{
           System.debug('Record failed');
        }
        }
    }
}

    //-----------------Upsert ------------
    public static void updateCasePriority (){
        List<Case> upsertRecord = new List<Case>();
       List<Case> caseList=  [Select id, caseNumber, status, priority, origin, reason
        from case
        where status = 'New'];
        // check the list and update the rcord 
        if(!caseList.isEmpty()){
            for(Case cs : caseList){
                cs.Priority = 'High';
                
               // add to  a collection to store both insert and update record 
               upsertRecord.add(cs);
                
            }
        }
        // insert the new record and add to the upsertRecord list 
        Case cs = new case();
        cs.Status = 'Working';
        cs.Priority = 'High';
        cs.Origin = 'web';
        cs.Subject = 'Wifi Issue ';
        cs.Reason = 'Performance';
        cs.Type = 'Mechanical';
        cs.Description ='Dear Customer support, my newly wifi router is not working'+
            +'Thank you';
        // add the new record to upsertRecord collection 
        upsertRecord.add(cs);
        
        //upsert the record to database
        if(!upsertRecord.isEmpty()){
        upsert upsertRecord;
        }
        // testing 
        System.debug('Number of DML Statement is used ..' + System.Limits.getDMLStatements());
        System.debug('Number of record proccessed' + System.Limits.getDmlRows());
        
    }
    public static void syncAccountDataToContact(String accountRecordName){
        if(accountRecordName != null && accountRecordName != ''){
             List<Account> accRecords = [Select id, Name, Industry, AnnualRevenue, rating, 
                                         phone, fax, billingCity, BillingStreet, BillingState, BillingCountry,BillingPostalCode,
                                         (Select id, firstName, lastName, phone, fax, mailingstreet, mailingCity, mailingState, 
                                          mailingCountry,mailingPostalCode from Contacts)
                                        From Account
                                        Where Name =:accountRecordName];
            System.debug('Number of Account record is ..'+ accRecords.size());
            if(!accRecords.isEmpty()){
                for(Account acc:accRecords ){
                     List<Contact> conToUpdate = new List<Contact>();
                    if(!acc.Contacts.isEmpty()){
                        for(Contact con :  acc.Contacts){
                            con.Phone = acc.Phone;
                            con.Fax = acc.Fax;
                            con.MailingStreet = acc.BillingStreet;
                            con.MailingCity = acc.BillingCity ;
                            con.MailingState = acc.BillingState;
                            con.MailingCountry = acc.BillingCountry;
                            con.MailingPostalCode = acc.BillingPostalCode ; 
                            conToUpdate.add(con); 
                           
                        }
                        if(!conToUpdate.isEmpty()){
                            Update conToUpdate;
                        }
                        
                    }
                }
            }
        }
        
    }
    
    public static void transferAccountRecords(String strartingChars, String uName){
        if(strartingChars != null && strartingChars != '' && uName != '' && uName != null){
            strartingChars += '%';
            List<Account> accRecord = [Select id, name, rating , annualRevenue, Industry
                                      from account
                                      Where name like: strartingChars ];
            if(!accRecord.isEmpty()){
                User userToTransfer = [Select id, firstName, lastName, userName, isActive 
                                      from user
                                      where userName = : uName and isActive = True];
                if(userToTransfer.Id != null){
                    for(Account acc: accRecord){
                        acc.OwnerId = userToTransfer.Id;
                    } 
                    update accRecord;
                }
            }
        }
    }
    // DeActive user 
    public static void deActivateUser(String UserRecordName){
        if(UserRecordName !=null && UserRecordName != ''){
            User userToDeactivate = [Select id, firstname, lastName, userName
                                    from user
                                    Where userName = : UserRecordName];
            if(userToDeactivate != null){
                userToDeactivate.IsActive = false;
                update userToDeactivate;
            }
        } 
    }
    // update aacount record
    public static void updateAccountRecords(String industryName){
        if (industryName != null && industryName != ''){
            List<Account> accRecords  = [Select id, Name, industry, Rating, annualRevenue
                                        from account
                                        where industry =: industryName];
            if(!accRecords.isEmpty()){
                for(Account acc : accRecords){
                    acc.Rating = 'Hot';
                    acc.annualRevenue = 7000000;                }
            }
            
            update accRecords;
        }
    } 
    
    public static void reStoreLeadRecords(String lastNameRecord){
        if (lastNameRecord != null && lastNameRecord != ''){
            lastNameRecord += '%';
                list<Lead> lstLeads = [Select id, lastName, firstName, Title
                                      from Lead
                                      where lastName like : lastNameRecord and isDeleted = True
                                      All Rows];
            if(!lstLeads.isEmpty()){
                Undelete lstLeads;
            }
        }
    }
    // remoing lead record delete statement 
    public static void removeLeadRecords(String startingChars){
        /*
        if(startingChars != null && startingChars != ''){
            startingChars += '%';
            List<Lead> lstLead = [Select id, firstname, lastname 
                                  from lead
                                 where lastname like : startingChars];
            if(!lstLead.isEmpty()){
                Delete lstLead;
            }
        }*/ 
        Delete [Select id, firstname, lastname 
                                 from lead
                                 where lastname like : startingChars + '%'];
    }
    public static void createBulkLeadRecords(){
        List<Lead> lstLeads = new List<Lead>();
        
        for (Integer counter = 1; counter <= 50; counter++ ){
            // crate lead record
            Lead ldRecord = new Lead();
            ldRecord.FirstName = 'Sample' + counter;
            ldRecord.LastName = 'Test Lead' + counter;
            ldRecord.Title = 'Sales Executive ';
            ldRecord.Rating = 'Hot';
            ldRecord.AnnualRevenue = 5000000;
            ldRecord.Industry = 'Banking';
            ldRecord.Company = 'tcs';
            ldRecord.State = 'Open - Not Contacted';
            ldRecord.Street = 'Daulatpur';
            ldRecord.City =  'Gonda';
            ldRecord.State = 'UP';
            ldRecord.Country = 'India';
            ldRecord.LeadSource = 'Web';
            ldRecord.Email = 'Testlead' + counter + '@gmail.com';
            ldRecord.Phone = '45676543456';
            
            // add record tpo collection 
            lstLeads.add(ldRecord);
            
            
        }
        if(!lstLeads  .isEmpty()){
            Insert lstLeads;
            System.debug('Number of DML statements used .. ' + System.Limits.getDmlStatements());
            System.debug('Number of record processed through dml' + System.Limits.getDmlRows());
        }
    }

}