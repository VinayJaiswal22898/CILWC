public class HiringManagerTriggerHandler {
    public static void AfterInsert(List<Hiring_Manager__c> hrRecords){
         // create a list to store bulk recruiter records
        List<Recruiter__c> recuriterToInsert = new  List<Recruiter__c>();
        system.debug(hrRecords);
        
        for(Hiring_Manager__c hrRecord : hrRecords){
           // create related to record 
            Recruiter__c recRecord = new Recruiter__c();
            recRecord.Name = hrRecord.Name;
            recRecord.Designation__c = hrRecord.Designation__c;
            recRecord.Email_Address__c = hrRecord.Email__c;
            recRecord.Contact_Number__c = hrRecord.Contact__c;
            recRecord.CityName__c = hrRecord.Location__c;
            // map the relation 
            recRecord.Hiring_Manager__c = hrRecord.Id;
            
            // adding record to collection
            
            recuriterToInsert.add(recRecord);
        }
        system.debug(recuriterToInsert);
        if(! recuriterToInsert.isEmpty()){
            insert recuriterToInsert;
        }
       
    }
    public static void AfterUpdate(List<Hiring_Manager__c> hrRecords, Map<Id,Hiring_Manager__c > mapOld, Map<Id,Hiring_Manager__c > mapNew ){
        // store the hr record ids
        List<Id> updatedHRRecordIds = new List<Id>();
        for(Hiring_Manager__c hrRecord : hrRecords){
            if((mapOld.get(hrRecord.Id).name != hrRecord.Name)|| 
               (mapOld.get(hrRecord.id).Email__c != hrRecord.Email__c)||
              (mapOld.get(hrRecord.id).Location__c != hrRecord.Location__c )|| 
               (mapOld.get(hrRecord.id).Designation__c != hrRecord.Designation__c)||
               (mapOld.get(hrRecord.id).Current_CTV__c != hrRecord.Current_CTV__c)||
               (mapOld.get(hrRecord.id).Contact__c != hrRecord.Contact__c)){
                   updatedHRRecordIds.add(hrRecord.id);  
               }
        }
        if(!updatedHRRecordIds.isEmpty()){
            //Fetch the related record to update  
            List<Recruiter__c> lstRecruiterRecord = [Select id , Hiring_Manager__c
                                                  from Recruiter__c
                                                 Where Hiring_Manager__c IN : updatedHRRecordIds];
            // store the recruiter record for bulkification
            List<Recruiter__c> lstRecruiters = new List<Recruiter__c>();
            if(!lstRecruiterRecord.isEmpty()){
                // write the code to sync the data from hiring_manager to recruiter object
                for(Recruiter__c rec : lstRecruiterRecord){
                    // get the hiring manager record
                    Hiring_Manager__c hrRecord = mapNew.Get(rec.Hiring_Manager__c);
                    
                    // sync the data 
                    rec.Name = hrRecord.Name;
                    rec.Contact_Number__c = hrRecord.Contact__c;
                    rec.Designation__c =hrRecord.Designation__c;
                    rec.Email_Address__c = hrRecord.Email__c;
                    rec.CityName__c= hrRecord.Location__c; 
                    lstRecruiters.add(rec);
                }
            }
            // commit the changes to database
            if(!lstRecruiters.isEmpty()){
                update lstRecruiters;
            }
            
        }
        
    }

}