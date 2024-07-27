@RestResource(urlmapping = '/Account/*')
global class GetAccountRecords {
    @HttpGet
    global static List<Account> getAccontDetails(){
        return [select id, name from account limit 2];
    }
    @HttpPost
    global static Account postAccountDetails(string accName){
        Account acc = new Account();
        acc.name = accName;
        insert acc;
        return acc;
    }

}