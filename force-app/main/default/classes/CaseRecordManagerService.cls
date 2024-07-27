@RestResource(URLMapping = '/CaseRecordService/*')
global class CaseRecordManagerService {
    @HttpPut
    Global static string updateCaseRecord(String cNumber, String cPriority, String cStatus){
        if(cNumber !=null && cNumber != ''){
            Case Cs = [Select id, casenumber, priority, status
                                  from case
                                  Where CaseNumber =: cNumber];
            if(Cs.Id !=null ){
                    cs.Priority = cPriority;
                    cs.Status = cStatus;
                    update Cs;
                    return 'Case Updated';
        }
            else
                {
                    return 'Case Record not found / Invalid case number ';
                }
            
    }
    else {
         return 'please provide case number';
    }
}
}