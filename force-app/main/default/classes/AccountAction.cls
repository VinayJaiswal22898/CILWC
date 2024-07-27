public class AccountAction {
    @InvocableMethod
    public static void updateAccount(List<Id> ids){
        List<Account> accUpdated = New List<Account>();
        List<Account> accToUpdate = [select id, name 
                                    from account
                                    where id =:ids];
        For(Account acc :accToUpdate ){
            acc.Name = acc.Name + 'test';
            accUpdated.add(acc);  
        }
        if(!accUpdated.isEmpty()){
            update accUpdated;
        }
        
        
    }

}