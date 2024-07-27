public class TestMap {
    public static void test(String stratingchar){
        if(stratingchar !=null && stratingchar != ''){
         stratingchar += '%';
            for(Account acc : [Select id, name from account where name like : stratingchar]){
                system.debug(acc);
            }
            }

}
}