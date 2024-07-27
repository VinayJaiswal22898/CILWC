public class ColleationSObject {
    public static void demoSObject(){
       // generic SObject
        SObject obj; 
        obj= new Account(Name='my Account');
        Account acc = (Account) obj;
        System.debug(acc);
        obj = new Contact(FirstName= 'Ram', LastName = 'Vinay');
        Contact con = (Contact)obj;
        System.debug(con);
        
        
        //--- applying loop over list, set and Map
        List<Account> accList = new List<Account>();
        Set<Id> accIds = new Set<Id>();
        accList = [Select id, Name from account Limit 2];
        //system.debug(accList);
        
        if(!accList.isEmpty()){ // null check
        for(Account acc1: accList){ // loop on List
           accIds.add(acc1.id); 
           //accIds.add(acc1.RecordTypeId);
        }
        }
        //or direct pass SOQL and dont need to check null value
        Set<ID> idsAcc = new Set<Id>();
        for(Account acc2 : [Select id, Name from account Limit 2]){
            idsAcc.add(acc2.id);
        }
        system.debug('Account Ids:'+accIds);
        system.debug('Account Ids SOQL INSIDE LOOP:'+idsAcc);
        
        // Loop on Set
        if(!idsAcc.isEmpty()){
            for(Id i : idsAcc){
                system.debug('Id:'+i);
            }
        }
        
        // Map
        Map<Id, Account> idToAccountMap = new Map<Id, Account>([Select id, name from account limit 2]);
        
        if(!idsAcc.isEmpty()){
            for(Id i : idsAcc){
                if(idToAccountMap.ContainsKey(i)){
                    system.debug(idToAccountMap.get(i));
                }
                system.debug('Id:'+i);
            }
        }
        if(!idToAccountMap.isEmpty()){
            for(Account ak : idToAccountMap.values()){ //it will return values Account(id,name, rating)
                system.debug('Account Id=>'+ak.id);
            }
        }
        
        if(!idToAccountMap.isEmpty()){
            for(Id ids : idToAccountMap.KeySet()){ //it will return Ids only 
                system.debug('IDS=>'+ids); 
            }
        }
    }

}