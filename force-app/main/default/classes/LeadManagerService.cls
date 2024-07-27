@RestResource(URLMapping = '/LeadService/*')
global class LeadManagerService {
    @HttpGet
    Global static lead getleadRecords(){
        Map<String, String> inputParams = RestContext.request.params;
        Lead leadRecord = [Select id, firstname,LastName 
                              from Lead
                              Where Id =: inputParams.get('ID')];
        Return leadRecord; 
    }

}