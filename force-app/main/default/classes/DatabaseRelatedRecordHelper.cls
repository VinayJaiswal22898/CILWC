public class DatabaseRelatedRecordHelper {
    // child to parent with standard relationship 
    public static void getCaseDetailsByCaseNumber(String caseNumber){
        If(caseNumber != null && caseNumber != ''){
            List<Case> caseRecord = [Select id, caseNumber, priority, subject, type,
                                     contact.firstName, Contact.lastName, contact.email,
                                     Contact.Account.Name, Contact.Account.Rating, Contact.Account.Industry, Contact.Account.annualRevenue,
                                     Contact.Account.Owner.FirstName, Contact.Account.Owner.LastNAME,
                                     Contact.Account.owner.Profile.Name,
                                     Contact.Account.Owner.Profile.UserLicense.name
                                     from Case
                                     where CaseNumber =: caseNumber];
           System.debug('number of case Record is ..' + caseRecord.size());
            if(!CaseRecord.isEmpty()){
                For(Case cs : caseRecord){
                    System.debug('Case Record'+ cs);
                    System.debug('Contact record is ..'+ cs.Contact.firstName + ' ' + cs.Contact.lastName);
                   System.debug('Account record is ..'+ cs.Contact.account.name);
                    System.debug('Owner Nmae is ..' + cs.Contact.Account.Owner.FirstName+ ' ' + cs.Contact.Account.Owner.LastName);
                    System.debug('Profile Name is ..' + cs.Contact.Account.owner.Profile.Name);
                    System.debug('User License Name is..' +cs.Contact.Account.Owner.Profile.UserLicense.name );
                   
                }
            }
        }
    } 
    
    // Parent to child with custom realtionship 
    public static void getHRRecordDetails(String hrRecordEmail){
        if(hrRecordEmail != null && hrRecordEmail!= '' ){
           List<Hiring_Manager__C> hrRecord =  [SELECT Id, Name, Location__c, Designation__c, Contact__c, Email__c, Current_CTV__c,
             (SELECT Id, Description__c, Location__c, Maximum_Budget__c, MileStone_Date__c, Minimum_Expected_CTC__c, 
              Minimum_Pay__c, Name, Number_Of_Vacancies__c FROM NewPositions__r)
             FROM Hiring_Manager__c
              where Email__c=:hrRecordEmail ];
            System.debug('Number of HR records '+ hrRecord.size());
            
            if(!hrRecord.isEmpty()){  
                for(Hiring_Manager__c hr : hrRecord){
                    System.debug('Hr Record'+ hr);
                    
                    // checking the size of new postions
                    System.debug('Number of New Position Records'+ hr.NewPositions__r.size());
                    
                    if(!hr.NewPositions__r.isEmpty()){
                        for( New_Position__c np : hr.NewPositions__r){
                            System.debug('New Position Record is '+ np);
                        }
                    }
                }
            }
        }
    }
    
    // Parent to child with standard association 
    public static void getAccountRelatedRecords(String accountName){
        if(accountName != null && accountName != ''){
           List<Account> lstAccount= [Select Id, name, rating, industry,annualRevenue, active__c,
             (Select id, firstName, LastName,Email, Description, Department, Title from contacts ), 
              (Select id from cases ) 
             from account
            where Name =: accountName];
            System.debug('Account size '+ lstAccount.size());
            // checking the list
            if(!lstAccount.isEmpty()){
                for(Account acc: lstAccount){
                    System.debug('Account id is ..' + acc.id);
                     System.debug('Name is ..' + acc.name);
                   
                    // checking contact size 
                    System.debug('Contact reocrd size is ..'+ acc.Contacts.size());
                   
                    if(!acc.Contacts.isEmpty()){
                        for( Contact con : acc.contacts ){
                            System.debug('Account Record'+con);
                        }
                    
                        }
                    // checking case size 
                    If(!lstAccount.isEmpty()){
                        for(Case ceRecord : acc.cases){
                            System.debug('Case record is ..'+ ceRecord);
                        }
                    }
                } 
            }
        }
      System.debug('Number of soql query used ..'+ System.Limits.getQueries());
        System.debug('Number of records returned by the query' +  system.limits.getQueryRows());
    }

}