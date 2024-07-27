public class scenario11Handler {
    public static void updateAcc(List<Account> accNew){
        Map<Id, String> accNameMap = new Map<Id,String>();
        for(Account acc : accNew){
            accNameMap.put(acc.Id, acc.Name);
        }
        if(!accNameMap.isEmpty())
{
    List<Contact> conToUpdate = [select id,lastname ,accountId
                                 from contact
                                 where AccountId In : accNameMap.keyset()];
    if(!conToUpdate.isEmpty()){
        for(contact con : conToUpdate){
            con.lastName = accNameMap.get(con.AccountId);
        }
    }
    update conToUpdate;
} 
}
}