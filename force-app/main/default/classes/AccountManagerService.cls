@RestResource(URLMapping = '/AccountService/*')
Global class AccountManagerService {
    @httpGet
    global static List<Account> GetAllAccountrecord(){
        RestRequest req =  RestContext.request;
        RestResponse res = RestContext.response;
        String accid = req.params.get('AccountID');
        List<Account> accList = [Select id, name
                                 from Account 
                                 where Id =:accid];
        return accList;
    }
}