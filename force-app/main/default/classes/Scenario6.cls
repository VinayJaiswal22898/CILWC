/**6. Limit reached the records?
Ans:**/
public class Scenario6 {
    public static void limitReachedAccount(List<Account> accNew, Map<Id,Account> accMap){
        Integer count=0;
        List<Account> accList = [Select id, name 
                                from Account
                                where createddate = today or lastmodifieddate=today];
        if(accNew !=null && !accNew.isEmpty()){
            for(Account acc :accNew){
               count= accList.Size();
                if(count>2){
                    acc.adderror('Reached limit today');
                }
            }
        }
    }

}