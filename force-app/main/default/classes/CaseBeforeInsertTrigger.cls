public class CaseBeforeInsertTrigger {
///Generated for Decodeforce programming test
	public static void beforeInsert(List<Case> newCases){

		/* Write your logic below */
    Set<Id> accIds = new Set<Id>(); // store the account id 
if(newCases!=null && !newCases.isEmpty()){
    for(Case newCase : newCases){
        if(newCase.AccountId !=null){
            accIds.add(newCase.AccountId);

        }
    }
}
if(!accIds.isEmpty()){
    Map<Id, Account> accMap = new Map<Id, Account> ([Select id, rating 
    from account 
    where Id In : accIds]);
    List<Case> caseToUpdate = new List<Case>();
    IF(!accMap.isEmpty()){
            for(Case cs : newCases){
                if(accMap.values().rating == 'Hot'){
                    cs.priority = 'High';
                    caseToUpdate.add(cs);
                }
                else if(accMap.values().rating == 'Warm'){
                    cs.priority = 'Medium';
                    caseToUpdate.add(cs);
                }
                else if(accMap.values().rating == 'Cold'){
                    cs.priority = 'Low';
                    caseToUpdate.add(cs);
                }
            }
    }
    if(!caseToUpdate.isEmpty()){
        update caseToUpdate;
    }
}
	
	}
}