public class AccountTriggerOwnerHandler {
    public static void salesRep(List<Account> accRecords) {
        set<Id>  ownerIds = new Set<Id>();
        for(Account acc : accRecords){   
            ownerIds.add(acc.OwnerId);
            }
            Map<Id, User>  usrMap = new Map<Id, User>([Select id, name,	Alias from user where id  in : ownerIds ]);
            system.debug(usrMap);
            if(!usrMap.isEmpty()){
               for(Account acc : accRecords){
                system.debug(usrMap.get(acc.OwnerId));
                                   system.debug(usrMap.get(acc.OwnerId).name);
                   acc.Sales_Rep__c =  usrMap.get(acc.OwnerId).name;    
               }
            }
    }
}