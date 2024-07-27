@RestResource(URLMapping = '/HrService/*')
global class HiringManagerService {
    @HttpDelete
    Global static string deleteHRRecord(){
        Map<String, String> inputParams = RestContext.Request.params;
        String hrRecord = inputParams.get('Id');
        delete [Select id, name from hiring_manager__c
               where Id =:hrRecord];
        return 'Record Deteled';
    }

}