@RestResource(URLMapping = '/HRPatchService/*')
global class HiringManagerPatchService {
    @HttpPatch
    global static string patchHRRecord(String hrLocation){
        if(hrLocation !=null && hrLocation != ''){
            List<Hiring_Manager__c> hrRecords = [Select id, name, location__c,Contact__c 
                                                from Hiring_Manager__c
                                                where location__c =: hrLocation];
            if(!hrRecords.isEmpty()){
                List<Hiring_Manager__c> hrToUpsert = new List<Hiring_Manager__c>();
                
                // updating record
                For(Hiring_Manager__c hr :hrRecords ){
                    hr.Contact__c = '0000';
                    hrToUpsert.add(hr);
                }
                // creating new record
                Hiring_Manager__c hrnew = new Hiring_Manager__c();
                hrnew.name = 'Rubi';
                hrnew.location__c = 'Delhi';
                hrnew.Contact__c = '8877666';
                hrnew.Email__c = 'rubi@gmail.com';
                // add record to list
                hrToUpsert.add(hrnew);
                upsert hrToUpsert; // upsert 
                return 'Hr Record Updated successfully';
            }
            else {
                return 'No Matching Record';
            }
        }
        else {
            return 'Please provide Hr city name name';
        }
    }

}