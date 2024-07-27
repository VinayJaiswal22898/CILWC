@RestResource(URLMapping = '/GetCaseRecordService/*')
global class CaseRecordDetailsService {
    @HttpGet
    Global static case getCaseDetailsById(){
        Map <String, String> inputParms = RestContext.Request.params;
            
           Case lstCase=  [SELECT Id, Description, Type, Status, Reason, Origin, Subject, Priority, CaseNumber FROM Case
                                          where Id =: inputParms.get('Id')];
        return lstCase;
    }

}