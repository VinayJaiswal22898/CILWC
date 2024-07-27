public class DatabaseHelper {
   //------------ Dynamic SOQL Query
       public static void getAccountCountRecords(String objName){
           //Static SOQL Query 
           Integer accCount = [Select Count() From Account];
           System.debug('Number of Account Record is ..'+accCount);
           // Dynamic SOQL Query
          String accountQuery= ' Select Count() From ' + objName;  // alwasy give space after 'from' when concatenating with object b
          Integer accountCount= Database.countQuery(accountQuery);
          System.debug('Account Record Count is ..'+accountCount);
       }
    //like operator usecase
    public static void getAccountBySearchText(String startringChars){
        if(startringChars !=null && startringChars != ''){
            startringChars += '%';
        	for(Account acc: [Select id, name, Rating, industry, annualRevenue 
                             	from Account 
                              Where Name LIKE : startringChars])
            {
                                  System.debug('Account Record is...'+ acc);
            }
            System.debug('Number of records found ..'+ System.limits.getQueryRows());
        }
       
    } 
   //----------------------------- like operator usecase2
    //get the position record, which are having 'java'
    public static void getPositionBySearchText(String startringChars){
        if(startringChars !=null && startringChars!= ''){
           startringChars= '%' + startringChars + '%';
            //iterate the rcord and print it 
            for(New_Position__c np : [SELECT Id, Name, Location__c, Number_Of_Vacancies__c, Position_Status__c, Open_Date__c, 
                                      MileStone_Date__c, Minimum_Pay__c, Maximum_Budget__c, HR_Email_Address__c, 
                                      Travel_Required__c, Passport_Required__c, Description__c, Skilled_Required__c, HR_Contact_Number__c 
                                      FROM New_Position__c
                                     Where Name like : startringChars ]){
                                          System.debug('New Postion Record name is ..'+np);
                                          
                                      }
            System.debug('Number of records found ..'+ System.limits.getQueryRows());
        }
    }
    // write a query to fetch opportunity record whose name is ending with kumar
    public static void getOpportunityReocrds(String oppName){
        if(oppName!= null && oppName != ''){
            oppName = '%' + oppName;
            for(Opportunity opp : [SELECT Id, Name, Description, StageName, Amount, Probability, ExpectedRevenue, CloseDate, Type, LeadSource 
                                   FROM Opportunity 
                                  Where Name like :oppName]){
                System.debug('Opportunity record'+opp);
            }
        }
    }
    
    // use case WAP To fetch  all the contact record based on the specified Industry Name
    public static void getContactByIndustryName(String industryName){
        if(industryName!= Null && industryName != ''){
            // get account record based on industry name 
         Map<Id, Account> mapAccount = new Map<Id, Account>([Select id, Name,Rating ,Industry 
                                                             FROM Account
                                                            Where Industry =: industryName ]);// assigning industryName value to to Industry field Name
            System.debug('Number of Industry Record'+ mapAccount.size());
            // Get all the related contact record
            if(!mapAccount.isEmpty()){
                List<Contact> lstContact = [Select id, firstName, lastName
                                            From Contact
                                           Where AccountId In : mapAccount.KeySet()]; // comparing the mapAccount id to to in contact AccountId 
                System.debug('Number of Related Contact record is ...'+lstContact.size());
                if(!lstContact.isEmpty()){
                    for(Contact con : lstContact){
                        System.debug('Contact Record  is .. '+con);
                    }
                }
            }
        }  
    }
    //Assignment 3 
    public static void getCaseRecords(){
        for(Case ce : [SELECT Id, Description, CaseNumber, ClosedDate, ContactEmail, ContactFax, IsClosed, IsDeleted, IsEscalated, Origin, Reason, Priority, Status, Subject, Type FROM Case Limit 2])
        {
             System.debug('Case Record' + ce);
             System.debug('-----------------------------------------');
                       }
        System.debug('Number of case record return'+System.Limits.getQueryRows());
    }
    //Assignment 2   
    public static void getUserRecords(){
        Map<Id, User> urRecord = new Map<Id, User>( [SELECT Id, Username, LastName, FirstName, Name, CompanyName, Division, Department, Title, 
            Street, City, State, PostalCode, Country, Email, Phone FROM User]);
        
        if(!urRecord.isEmpty()){
            For(User ur: urRecord.Values()){
                System.debug('User Record'+ur);
            }
        }
    }
    // Assignment 1 
    public static void getEmailTemplateRecords(){
        List<EmailTemplate> etRecord = [SELECT Id, Name, FolderName, Subject, Description FROM EmailTemplate Limit 5];
        System.debug('Total Email Template'+ etRecord.size());
        if(!etRecord.isEmpty()){
            for(EmailTemplate et:etRecord){
                System.debug('EmailTemplate Record'+et);
            }
        }
    }
    public static void GetAccountByIndustry(String industryName){
        if(industryName!= null && industryName != ''){
            List<Account> lstAccount = [Select id, name, rating, industry, annualRevenue, active__c
                                       from account
                                       where Industry =: industryName ];
            system.debug('Account record size -- '+ lstAccount);
            if(!lstAccount.isEmpty()){
                for(Account acc:lstAccount )
                System.debug('Account rec ord is .. '+acc);
            }
            
        }
    }
    public static void GetAllLeads(Integer l, Integer off){
        List<Lead> lstLead =  [SELECT id, firstName, LastName, title, Company, phone, fax
                                    FROM Lead 
                                    //order by firstName
                                    Limit: l
                              //offset :off
                              For Update];
        System.debug('Lead size'+lstLead.size());
        if(!lstLead.isEmpty()){
            for(Lead ld: lstLead){
                System.debug('All the Contact Record' + ld) ;
            }
        }
    }
    public static void GetAllContacs(){
        List<Contact> lstContact =  [SELECT id, FirstName, LastName, Title, department, phone, fax, isDeleted
                                    from Contact 
                                    order by firstName
                                    ALL ROWS];
        System.debug('Contact size'+lstContact.size());
        if(!lstContact.isEmpty()){
            for(Contact con: lstContact){
                System.debug('All the Contact Record' + lstContact);
            }
        }
    }
    public static void GetAllHRRecords(){
        /*
        List<Hiring_Manager__C> lstHRRecords = [SELECT id, name, Location__c, contact__C,
                                                email__c, designation__c from hiring_manager__C];
        
        Map<Id, Hiring_Manager> mpHRRecords = new Map<Id, Hiring_Manager__C>(); 
        
        if(!lstHRRecords.isEmpty()){
            for(Hiring_Manager__c hr :lstHRRecords ){
                mpHRRecords.put(hr.id, hr);
            }
        }
        */
          Map<Id, Hiring_Manager__c> mpHRRecords = new Map<Id, Hiring_Manager__C>(
                 [SELECT id, name, Location__c, contact__C,  // first this spql query run and it will  store all the data 
               email__c, designation__c from hiring_manager__C]);//into tem memory. then it will add all the data to map collection automatically
        
        System.debug('Number of Hiring Manager records'+ mpHRRecords.size());
        
        if(!mpHRRecords.isEmpty()){
            For(Hiring_Manager__c hr :mpHRRecords.values() ){
                System.debug('Hiring Manager ID is ..'+hr.id);
                System.debug('Hiring Manager name is ..'+hr.Name);
                System.debug('Contact is ..'+hr.Contact__c);
                System.debug('Designation is ..'+hr.Designation__c);
                System.debug('Email is ..'+hr.Email__c);
                System.debug('Location is ..'+hr.Location__c);
                
            }
        }
    }
    public static void GetOpportunityRecords(){
      
            for(Opportunity opp: [SELECT id, Name, amount, closedate,Stagename from opportunity Limit 5 ]) 
                // soql query execute only once 
                // it will store the the result into tem memory 
                // and from tem memory opp variable fetch one by one record till end
                
            {
                // if we wrirte sql query here then it will execute multiple time and that is not recommended 
                system.debug('Opportunity id is --'+ opp.id);
                system.debug('Opportunity name is --'+ opp.name);
                system.debug('Opportunity Amount is --'+ opp.amount);
                system.debug('Opportunity CloseDate is --'+ opp.closedate);
                system.debug('Opportunity Stagename is --'+ opp.Stagename);
                
                System.debug('----------------------------------------------');
        }
        System.debug('Number of record return' + System.Limits.getqueryRows());
    }
    public static void GetAllAccounts(){
        
        List<Account> lstAccounts = [SELECT Id, Name, Industry, AnnualRevenue, Rating, Active__c FROM Account];
       
        system.debug('Collection size is --'+lstAccounts.size());
        if(!lstAccounts.isEmpty()){
            for(Account acc: lstAccounts){
                system.debug('Account id is --'+ acc.id);
                system.debug('Account name is --'+ acc.name);
                system.debug('Account Industry is --'+ acc.Industry);
                system.debug('Account AnnualRevenue is --'+ acc.AnnualRevenue);
                system.debug('Account Rating is --'+ acc.Rating);
                system.debug('Account Active is --'+ acc.Active__c);
                
                System.debug('-------------------------------------');
                
            }
        }
    }
}