public class AccountHelperexp {
    public static void insertAccountRecords(){
        for(Integer counter =0; counter<=2; counter++){
    Account acc = new Account();
    acc.Name = 'Newone'+counter ;
    acc.Rating = 'Hot';
    insert acc;
    if(acc.id !=null){
        system.debug('Account record inserted successfully'+acc.Id);
        
        // write coode to insert contact 
        contact con = new contact();
        con.Firstname = 'Alok' + counter;
        con.LastName = 'Singh';
        // map the contact to account 
        con.AccountId = acc.id;
        insert con;
        
        if(con!=null){
            system.debug('Related contact record inserted successfully'+ con.Id);
        }
    }
}
}
    }