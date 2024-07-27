public class AccountClass {
    public static void insertRecords(String str){
        for(Integer counter = 0; counter <=151; counter ++){
        Account acc = new Account();
        acc.Name = str + counter ;
        acc.Rating = 'Hot';
        insert acc;
            if(acc.id !=null ){
                system.debug(acc.id);
            }
     
    }
    }
}