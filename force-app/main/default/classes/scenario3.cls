/**3. Whenever a create opportunity object records updated total opportunities and total amount in account
object?**/
public class scenario3 {
    public static void opportunityAmountSum(List<Opportunity> oppNew){
        Map<Id, Decimal> oppMap = new Map<Id, Decimal>();
        if(oppNew!=null && !oppNew.isEmpty()){
            for(opportunity opp : oppNew){
                if(opp.AccountId !=null && opp.Amount !=null){
                    oppMap.put(opp.AccountId, opp.Amount);
                }
            }
        }
        if(!oppMap.isEmpty()){
            Map<Id, Decimal> mapResult = New Map<Id, Decimal>();
            for(AggregateResult agg : [Select AccountId, sum(Amount) totalsum
                                         from Opportunity
                                         Where AccountId In : oppMap.Keyset()
                                         group by AccountId]){
                mapResult.put((id)agg.get('AccountId') ,(decimal)agg.get('totalsum'));
            }
            if(!mapResult.isEmpty()){
                List<Account> accToUpdate = New List<Account>();
               for(Account acc : [Select id, name, Sum_of_Opps__c
                                 from account 
                                  where Id In :mapResult.keyset()])
               {
                                      acc.total_opp_amount__c  = mapResult.get(acc.Id);
                accToUpdate.add(acc);   
                   
                                  }
                if(!accToUpdate.isEmpty()){
                    update accToUpdate;
                }
            }
        }
}
}