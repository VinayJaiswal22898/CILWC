public  class Casetrigger00Handler {
    public static void updateCaseNumber(List<Case> newCaseRecord) {
    // store parrent Id of Case Object 
    Set<Id> accIds = new Set<Id>();
    if(newCaseRecord!=null && !newCaseRecord.isEmpty()){
        for(Case caseRecord : newCaseRecord){
            if(caseRecord.AccountId !=null){
                accIds.add(caseRecord.AccountId);
            }
        }
    }
    // now fetch account records and store it into Map 
    if(!accIds.isEmpty()){
        Map<Id ,Account>  mapAccountRecords = New Map<Id,Account>([Select Id, latest_case_number__c from account
        where Id In : accIds]) ;
        Map<Id,Account> accMapToUpdate = new Map<Id,Account>();
    if(!newCaseRecord.isEmpty()){
      for(Case caseRecord : newCaseRecord)  {
       if(mapAccountRecords.containsKey(caseRecord.AccountId)){
        Account acc = mapAccountRecords.get(caseRecord.AccountId);
        system.debug(acc);
        if(acc.latest_case_number__c !=caseRecord.CaseNumber){
            acc.latest_case_number__c = caseRecord.CaseNumber;
            accMapToUpdate.put(acc.Id, acc);
        }
       }
      }
    }
    if(!accMapToUpdate.isEmpty()){
        update accMapToUpdate.values();
    }  
    }  
    }
}