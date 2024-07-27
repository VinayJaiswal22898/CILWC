public class CreateAccountTriggerHandler {
    Static Boolean var = true ;
    public static void createAccountWithContact(){
        
        List<Contact> conNewRecords = trigger.new;  // new list records 
        
        List<Account> acclist = new List<Account>();   // account record to insert  
        if(conNewRecords !=null && !conNewRecords.isEmpty()){
            for(Contact con : conNewRecords){
                if(con.AccountId == null){
                   Account acc = new Account();
                   acc.Name = con.LastName;
                    acclist.add(acc);
                    system.debug(acc);
                }                    
           }
        }
        if(!acclist.isEmpty()){
            Insert acclist;  
            system.debug(acclist);
            
            }
        if(!acclist.isEmpty()){
             for(Account acc : acclist){
               for(Contact con : conNewRecords){
                con.AccountId = acc.id;
            }
        }
        }
        }
    }