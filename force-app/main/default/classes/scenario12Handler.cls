public class scenario12Handler {
    public static void updateAccountTotalAmount(List<Opportunity> oppNew, Map<Id, Opportunity> oldMap){
        Map<Id, Opportunity> oppMap = new Map<Id, Opportunity>();
        if(oppNew !=null && !oppNew.isEmpty()){
            // insert
            for(Opportunity opp : oppNew){
                if(opp.Amount !=null){
                    oppMap.put(opp.AccountId, opp);
                 }      
            }
              // update or undlete
        for(Opportunity opp : oppNew)
        {
                if(opp.AccountId !=null && (oldMap !=null && opp.AccountId !=oldMap.get(opp.Id).AccountId)){ // changing parent
                oppMap.put(opp.AccountId,opp); // update to new parent  
                oppMap.put(oldMap.get(opp.id).AccountId,opp); // update to old parent  
                                }
                else if (oldMap !=null && opp.Amount !=null && opp.Amount != oldMap.get(opp.Id).Amount){
                        oppMap.put(opp.AccountId ,opp); // without chaning parent and updating amount field 
                    }
            }
        // delete
        for(Opportunity opp : oppNew){
            oppMap.put(opp.AccountId,opp);
        }
        }
        if(!oppMap.isEmpty()){
            // fecth related account record
            Map<Id,Decimal> accToUpdate = new Map<Id,Decimal>();
            for(AggregateResult aggr : [Select AccountId, sum(amount) total
                                        from Opportunity
                                        Where AccountId =:oppMap.keySet()
                                      Group by AccountId]){
                                          
                     accToUpdate.put((id)aggr.get('AccountId'),(decimal)aggr.get('total'));       
                }
            if(!accToUpdate.isEmpty()){
                // fetach account record 
                List<Account> accUpdate = [select id, total_opp_amount__c
                                          from account
                                          where id =:accToUpdate.keyset()];
                for(Account acc : accUpdate){
                    acc.total_opp_amount__c = accToUpdate.get(acc.Id);
                }
                update accUpdate;
            }
        }
    }
}