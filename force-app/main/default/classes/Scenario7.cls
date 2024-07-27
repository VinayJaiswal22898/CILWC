/**7. Can not insert/update/delete that user account object records?
Ans:**/
public class Scenario7 {
    public static void updateAccountUser(List<Account> accNew){
        user u = [select id, name from user where username= 'priyankachopra22898@gmail.com'];
        if(u.Id== userinfo.getUserId()){
            for(Account acc: accNew){
                acc.addError('cant insert or delete or update record');
            }
        }
    }
}