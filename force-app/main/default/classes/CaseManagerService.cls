@RestResource(URLMapping = '/CaseServcieold/*')
global class CaseManagerService {
     @httpGet()
    Global static List<Case>  getNewCaseRecords(){
        List<Case> csList = [Select id , caseNumber, status, subject, origin from case
                            where status = 'New'
                            order by casenumber];
        return csList;
    }
}