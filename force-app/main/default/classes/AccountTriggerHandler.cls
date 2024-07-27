public class AccountTriggerHandler {
    public static void createOpportunityRecord(List<Account> accRecords){
        // creating list to insert opportunity record 
        List<Opportunity> oppInsertLst = new List<Opportunity>();
        // creating account list ot update account Client_Opportunity__c
        List<Account> accUpdateLst = new List<Account>();
       // creating map to store opp AccountId
        Map<Id, Id> mapOpp = new Map<Id, Id>();
        
       // iterating the loop on account to sync account value into opportunity 
        for(Account accRecord : accRecords){
            Opportunity oppObj = new Opportunity();
            oppObj.Name = accRecord.Name;
            oppObj.CloseDate = System.today().adddays(30);
            oppObj.StageName = 'Qualification';
            oppInsertLst.add(oppObj);
        }
        // checking ooportunity list before inserting the record
        if(!oppInsertLst.isEmpty()){
            Insert oppInsertLst; // inserting opp record 
        }
        // iterating opportunity record to fetch AccountID and store into map collection 
        for(Opportunity opp : oppInsertLst){
            mapOpp.put(opp.AccountId, opp.Id);   
        }
        // before updating account record checking mapOpp value 
        if(!mapOpp.isEmpty()){
            List<Account> accRecord = [Select id, Client_OpportunityLF__c from Account
                                      where Id IN : mapOpp.KeySet()];
            for(Account acc : accRecord ){
             acc.Client_OpportunityLF__c = mapOpp.get(acc.Id);
              accUpdateLst.add(acc);  
            }
            // check the accUpdateLst and update it 
            if(!accUpdateLst.isEmpty()){
                update accUpdateLst;
            }
        }
    }

}