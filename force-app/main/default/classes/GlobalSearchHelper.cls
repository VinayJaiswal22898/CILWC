public class GlobalSearchHelper {
    public static void searchRecords(){
        List<List<SObject>> lstRecords = [Find 'test*'  IN ALL FIELDS RETURNING 
                                         Account(id, name Limit 10),
                                         Contact(id, firstname, lastname),
                                          Lead(id, name),
                                         Hiring_Manager__C(id, name, location__c),
                                         New_Position__c(id, name, location__c)];
        if(!lstRecords.isEmpty()){
            // type caste each element and store them to your list collection
            List<Account> lstAccount = ( List<Account>) lstRecords.get(0);
                        List<Contact> lstContact = ( List<Contact>) lstRecords.get(1);
            List<Lead> lstLead = ( List<Lead>) lstRecords.get(2); 
            List<Hiring_Manager__C> lstHiringManager = ( List<Hiring_Manager__C>) lstRecords.get(3); 
            List<New_Position__c> lstNP = ( List<New_Position__c>) lstRecords.get(4);
            // display the record on debug file
            SYSTEM.DEBUG('Matching Record found ...' + lstAccount.size());
            for(Account acc: lstAccount){
                system.debug(acc);
            }
            System.debug('--------------------');
           SYSTEM.debug('Matching Record found ...' + lstContact.size());
            for(Contact con: lstContact){
                system.debug(con);
            } 
            System.debug('--------------------');
            SYSTEM.debug('Matching Record found ...' + lstLead.size());
            for(Lead ld: lstLead){
                system.debug(ld);
            } 
            System.debug('--------------------');
            SYSTEM.debug('Matching Record found ...' + lstHiringManager.size());
            for(Hiring_Manager__c hr: lstHiringManager){
                system.debug(hr);
            }
            System.debug('--------------------');
            SYSTEM.debug('Matching Record found ...' + lstNP.size());
            for(New_Position__c np: lstNP){
                system.debug(np);
            }
        }
    }
    public static void DynamicSearchRecords(string searchKeyword, string objDetails){
        if(searchKeyword != null && searchKeyword != ''){
            String dynamicSOSL = 'FIND' + '\'' + searchKeyword + '\'' + 'IN ALL FIELDS RETURNING ' +
                'Account(ID,Name, Rating),' + 'Contact (id, firstName, lastName)'; 
            if(objDetails != null && objDetails != ''){
               dynamicSOSL +=  ',' + objDetails;
            }
            List<List<SObject>> lstRecords = search.query(dynamicSOSL);
            if(!lstRecords.isEmpty()){
            // type caste each element and store them to your list collection
            List<Account> lstAccount = ( List<Account>) lstRecords.get(0);
                        List<Contact> lstContact = ( List<Contact>) lstRecords.get(1);
            List<Lead> lstLead = ( List<Lead>) lstRecords.get(2); 
            List<New_Position__c> lstNP = ( List<New_Position__c>) lstRecords.get(3);
            // display the record on debug file
            SYSTEM.DEBUG('Matching Record found ...' + lstAccount.size());
            for(Account acc: lstAccount){
                system.debug(acc);
            }
            System.debug('--------------------');
           SYSTEM.debug('Matching Record found ...' + lstContact.size());
            for(Contact con: lstContact){
                system.debug(con);
            } 
            System.debug('--------------------');
            SYSTEM.debug('Matching Record found ...' + lstLead.size());
            for(Lead ld: lstLead){
                system.debug(ld);
            } 
          
            System.debug('--------------------');
            SYSTEM.debug('Matching Record found ...' + lstNP.size());
            for(New_Position__c np: lstNP){
                system.debug(np);
            }
                    
        }
        }
        
    }
    

}