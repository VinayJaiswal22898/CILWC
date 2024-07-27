@RestResource(URLMapping = '/CaseServices/*')
global class CaseRecordService {
    @HttpGet()
    global static List<Case> getCaseRecords(){
        Map<String, String> inputParams = RestContext.request.params;
        
        List<Case> listCase = [Select id, casenumber, status ,priority, origin, reason
                              from case 
                              Where priority =:inputParams.get('Priority')];
        return listCase;
    }

}