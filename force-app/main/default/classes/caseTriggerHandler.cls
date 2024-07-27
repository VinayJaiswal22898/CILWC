//Generated for Decodeforce programming test
public class caseTriggerHandler{

	public static void afterInsert(){

		List<Case> newCases = Trigger.new;

		/* Write your logic below */
        Set<Id> accIds = new Set<Id>();
        for(Case newCase: newCases){
            if(newCase.AccountId !=null){
                accIds.add(newCase.AccountId);
            }
        }
        if(!accIds.isEmpty()){
            List<Account> accIdCaseCountMap = new List<Account>();
            for(Account acc : [Select Id,
                                (Select Id, AccountId from Cases) 
                                from account
                                 where Id IN : accIds ]){
                                    accIdCaseCountMap.add(acc);
                
            }
            if(!accIdCaseCountMap.isEmpty()){
            List<Task> lstTaskToInsert =new List<Task>();
            Set<Id> processedAccounts = new Set<Id>(); // To track processed Accounts
              for(Account acc :accIdCaseCountMap){ 
                if(acc.cases.size()>3){
                    Task tk = new Task();
                    tk.status = 'new';
                    tk.priority = 'High';
                    tk.whatId  = acc.Id;
                    lstTaskToInsert.add(tk);
                    
                }
              }
              
                if(!lstTaskToInsert.isEmpty())
                {
                insert lstTaskToInsert;
            }
            }
            
        }
	
	}
}