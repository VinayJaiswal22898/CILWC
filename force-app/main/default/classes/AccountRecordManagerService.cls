@RestResource(URLMapping = '/AccountUpdateService/*')
Global class AccountRecordManagerService {
    @HttpPut
    global static string updateAccountRecords(String accIndustry){
        if(accIndustry !=null && accIndustry != ''){
           List<Account> lstAccount = [Select id, name, industry, annualRevenue
                                       from Account
                                       Where Industry =: accIndustry] ;
            if(!lstAccount.isEmpty()){
                for(Account acc : lstAccount){
                    Switch On acc.Industry
                    {
                        When 'Banking'{
                            acc.Rating = 'hot';
                            acc.annualRevenue= 8700000;
                        }
                        When 'Finance'{
                            acc.Rating = 'Warm';
                            acc.annualRevenue = 75000;
                        }
                    }
                }
            update lstAccount;
            return 'Updated';
            }
            else {
                return 'no matching record found';
            }
            
        }
        else {
            return 'Please provide the industry name';
        }
    }

}