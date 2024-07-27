public without sharing class withSharingClass {
    public static List<Account> getAccountDetails(){
        return [select id, name from Account];
    }

}