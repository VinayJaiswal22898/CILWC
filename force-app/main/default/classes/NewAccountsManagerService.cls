@RestResource(URLMapping = '/NewAccountService/*')
global class NewAccountsManagerService {
    @HttpPost
    Global static string InsertNewAccount(String accName, string accRating, string accIndustry, 
                                         decimal accAnnualRevenue, string accPhone, string accFax,
                                         string accWebsite, string accType, string accOwnership,
                                          string accActive, string accPan
                                         )
    {
        Account acc = new Account();
    acc.name = accName;
    acc.Rating = accRating;
    acc.Industry = accIndustry;
    acc.AnnualRevenue = accAnnualRevenue;
    acc.Phone =accPhone;
    acc.Fax= accFax;
    acc.Website = accWebsite;
    acc.Type = accType;
    acc.Ownership = accOwnership;
    acc.Active__c = accActive;
   acc.PAN_Number__c = accPan;
    insert acc;
        if(acc.id !=null){
            return 'Account inserted Successfully';
        }
        else
            return 'somthing went wrong';
    }
}