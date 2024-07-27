@RestResource(URLMapping = '/BulkHRRecordService/*')
global class BulkHiringManagerRecordService {
    @HttpPost
    global static string insertBulkHRReocrd(){
        String hrRecordCollection = RestContext.Request.RequestBody.ToString();
        
        List<Hiring_Manager__c> lstHRRecord = (List<Hiring_Manager__c>)system.JSON.deserialize(hrRecordCollection, List<Hiring_Manager__c>.class);
        
            if(!lstHRRecord.isEmpty()){
                insert lstHRRecord;
                return 'success';
            }
        else 
            return 'faild'; 
         
    }

}