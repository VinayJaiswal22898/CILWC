@RestResource(URLMapping ='/AccountServcie/*')
global class AccountManagerService01{
    @HttpGet
    global static List<Account> GetAllAccountRecords(){
        List<Account> accList = [Select id, name, industry , Active__c, Rating
                                from Account
                                Order By Name limit 5];
        return accList;
        
    }

}