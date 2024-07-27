public with Sharing  class AccountManager {

public static List<Account> filterAccounts( List<Account> accList){
    List<Account> filterList = new List<Account>();
    /* Write your logic below */ 
        for(integer i =0; i<=accList.size(); i++ ){
            //check for odd index 
            if(math.mod(i,2)!=0){
                filterList.add(accList[i]);
            }
        }
    return filterList;
}
@auraEnabled()
public static List<Account> searchAccounts( String accountName){
    String searchKey = '%' + accountName + '%' ;
    return [select Id, Name, Rating, Phone, AnnualRevenue, Fax, Industry, type 
    FROM Account
    WHERE name =: searchKey
    ORDER BY Name];
}
}