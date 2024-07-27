public class RecruiterTriggerHandler {
    public static void AfterUpdate(List<Recruiter__c> lstRecruiters, Map<Id,Recruiter__c> oldRecords){
        //store the parent record ids 
        system.debug(lstRecruiters);
        List<ID> parentRecordIds = new List<ID>();
        // check for updated recruiter record details
        for(Recruiter__c recRecord : lstRecruiters){
            if((oldRecords.get(recRecord.id).Name != recRecord.Name )||
               (oldRecords.get(recRecord.id).Email_Address__c != recRecord.Email_Address__c )||
               (oldRecords.get(recRecord.id).CityName__c != recRecord.CityName__c )||
               (oldRecords.get(recRecord.id).Contact_Number__c != recRecord.Contact_Number__c )||
               (oldRecords.get(recRecord.id).Current_CTC__c  != recRecord.Current_CTC__c  )||
               (oldRecords.get(recRecord.id).Designation__c  != recRecord.Designation__c  )){
                  // store the parent record id inside the field
                   parentRecordIds.add(recRecord.Hiring_Manager__c);
               }     
        }
        // check recruiter record ids 
        if(!parentRecordIds.isEmpty()){
            // fetch the hiring manager record based by ids
            Map<ID,Hiring_Manager__c> hrRecords = new Map<ID,Hiring_Manager__c > ([Select id , Name
                                                from Hiring_Manager__c
                                                where Id IN :parentRecordIds]);
           system.debug(hrRecords);
           
            if(!hrRecords.isEmpty()){
                 List<Hiring_Manager__c> hrRecordToUpdate = new List<Hiring_Manager__c>();
                
                // Iterate the recruiter record and sync the data to hiring manager
                for(Recruiter__c recRecord : lstRecruiters){
                   
                    // get the recruiter record 
                    Hiring_Manager__c hrRecord = hrRecords.get(recRecord.Hiring_Manager__c);
                    // sync the data between records .. 
                    hrRecord.Name =recRecord.Name; 
                    hrRecord.Contact__c = recRecord.Contact_Number__c; 
                    hrRecord.Designation__c = recRecord.Designation__c;
                    hrRecord.Email__c = recRecord.Email_Address__c;
                    hrRecord.Current_CTV__c = recRecord.Current_CTC__c;
                    hrRecord.Location__c = recRecord.CityName__c;
                    // map the record 
                    hrRecord.Id = recRecord.Hiring_Manager__c;
                    
                    // add to hr list
                   // system.debug(hrRecord);
                    hrRecordToUpdate.add(hrRecord);
                }
               // system.debug(hrRecordToUpdate);
                if(!hrRecordToUpdate.isEmpty()){
                update hrRecordToUpdate;
            }
            }
            
            
        }
        
    }

}