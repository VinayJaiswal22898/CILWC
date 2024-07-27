public class opportunitytriggerooHandler {
    public static void checkOppSizeBeforeInsert(List<Opportunity> oppRecords , Map<Id, Opportunity> oldMap){
        Set<Id> accids = new Set<Id>();
        if(oppRecords!= null && !oppRecords.isEmpty()){
            for(opportunity opp : oppRecords){
                if(opp.AccountId!=null ||
                   (oldmap!=null && opp.AccountId != oldMap.get(opp.Id).accountID)){
                       accids.add(opp.accountId);
                       accids.add(oldMap.get(opp.Id).accountID);
                }
            }
        }
       if (!accids.isEmpty()) {
            Map<Id, Integer> oppCountByAccountId = new Map<Id, Integer>();
            for (AggregateResult ar : [
                SELECT COUNT(Id) oppCount, AccountId 
                FROM Opportunity
                WHERE AccountId IN :accids
                GROUP BY AccountId
            ]) {
                oppCountByAccountId.put((Id)ar.get('AccountId'), (Integer)ar.get('oppCount'));
            }

            // Check and add error for Accounts with more than 1 Opportunity
            for (Opportunity opp : oppRecords) {
                if (opp.AccountId != null && oppCountByAccountId.containsKey(opp.AccountId) && oppCountByAccountId.get(opp.AccountId) >= 2) {
                    opp.addError('Two opportunities already exist for this account');
                }
            }
        }
    }
}