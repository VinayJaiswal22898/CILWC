@Restresource(urlMapping = '/AccountGetPostService/*')
global class SalesforceCallInIntegration {
    @HttpGet
    global static List<Account> getAccountDetails(){
        return [Select id, name, phone from account limit 5];
    }
    @HttpPost
    global static List<Account> postAccountDetails(String accName, String accPhone){
        List<Account> acclst = new List<Account>();
        Account acc = new Account();
        acc.Name = accName;
        acc.Phone = accPhone;
        acclst.add(acc);
        
        if(!acclst.isEmpty()){
            insert acclst;
        }
        return acclst;  
    }
}