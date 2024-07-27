public class OppTrigger_26_feb_Handler {
    public static void updateAccStatus(List<Opportunity> oppNewRecords, Map<Id, Opportunity> oppOldMapRecords){
        // Store the Account Ids
        Set<Id> accIds = new Set<Id>();
        Map<Id,Account> mapIdAccount = new Map<Id, Account>(); 
        if(oppNewRecords !=null && !oppNewRecords.isEmpty()){
            for(Opportunity oppNewRecord : oppNewRecords){
                if(oppNewRecord.AccountId !=null || oppOldMapRecords !=null && oppNewRecord.AccountId != oppOldMapRecords.get(oppNewRecord.id).AccountId){
                    accIds.add(oppNewRecord.AccountId);
                    accIds.add(oppOldMapRecords.get(oppNewRecord.id).AccountId);
                }
            }
        }
        if(!accIds.isEmpty()){
            List<Opportunity> oppList = [Select id, accountId, Account.Status__c,stagename
                                        from Opportunity Where AccountId In : accids];
            if(!oppList.isEmpty()){
                for(Opportunity opp :oppList){
                    if(opp.stagename == 'Closed Won' && !mapIdAccount.containsKey(opp.accountId)){
                        Account acc = new Account();
                        acc.status__c = 'closed';
                        mapIdAccount.put(opp.AccountId,acc);
                    }
                    else if (opp.StageName != 'Closed Won') {
                    Account acc = new Account();
                    acc.status__c = 'Open';
                    mapIdAccount.put(opp.AccountId,acc);
                }
            }
            if(!mapIdAccount.isEmpty()){
                update mapIdAccount.values();
            }
        }
    }
}
}