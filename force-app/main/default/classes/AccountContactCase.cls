public class AccountContactCase {
    public static void insertRecords(){
        // creating account object 
        Account acc = new Account();
        acc.Name = 'OOOO Bank';
        // insert the record 
        insert acc;
        System.debug(acc.id);
        if(acc.id != null){
               Contact con = new Contact();
            con.LastName = acc.Name;
            con.AccountId = acc.id;
                // insert the contact record 
                insert con;
                if(con.id != null){
                     System.debug(con.id);
                    Case cs = new Case();
                   cs.Subject = 'Creating new case';
                   cs.Status = 'New';
                    cs.Origin = 'Web';
                    cs.AccountId =con.id;
                    cs.AccountId = acc.id;
                    insert cs;
                    if(cs.id != null){
                        system.debug(cs.id);
                    }
                    
            }
        }
    
    }
    

}