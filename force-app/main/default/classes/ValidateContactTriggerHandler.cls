public class ValidateContactTriggerHandler {
    public static void valBeforeInsert(List<Contact> newConRecords){
        set<Id> accIds = new Set<Id>();
        if(!newConRecords.isEmpty()){
            for(Contact con : newConRecords){
                if(con.AccountId !=null){
                    accIds.add(con.AccountId);
                    system.debug(con.AccountId);
                }
            }
        }
         Map<ID, Integer> contactCountMap = new Map<Id, Integer>();
        if(accIds!=null && !accIds.isEmpty()){  
            List<AggregateResult> aggRel = [Select Count(Id) contactcount, accountId from contact 
                                            where AccountId IN : accIds group by accountId];
            
            if(!aggRel.isEmpty()){
                for(AggregateResult agg :aggRel ) {
                   contactCountMap.put((id)agg.get('accountId'),(integer)agg.get('contactcount'));     
                }
            }                               
        }
        if(!newConRecords.isEmpty()){
            for(Contact con : newConRecords){
                if(con.AccountId!=null && contactCountMap.get(con.AccountId) >=2){
                    con.adderror('already two contact');
                }
            }
        }
    }

}